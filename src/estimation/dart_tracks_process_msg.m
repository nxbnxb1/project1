function [trk, info] = dart_tracks_process_msg(trk, hdr, det, pb, t_now, cfg)
%DART_TRACKS_PROCESS_MSG Delay-aware Kalman update with one perception message.
%
%   delay_comp = true  (DART, Eq. 12, 23-27):
%     y is formed with the pose estimate at the CAPTURE time t_c, and the
%     update is applied at t_c to the prior predicted from the last
%     posterior (exact under A4: no other update between t_upd and t_c).
%   delay_comp = false (naive baseline):
%     the stale image is interpreted with the CURRENT pose and treated as a
%     measurement at the arrival time.
%
%   Association (method §6, R13). The detections carry no identity: their id is
%   only the index of a segment in that image. Every active track is
%   predicted to t_meas; a detection k may be
%   assigned to track i only if the squared Mahalanobis distance
%   e_ik = nu' S^-1 nu, S = H P H' + R_y, is inside the chi2 gate; the
%   assignment is greedy global nearest neighbour on the cost
%   e_ik + ln det S_ik. An unassigned detection starts a new track (used by
%   the safety layer immediately). A track that is not assigned although it
%   is EXPECTED in the image (centre inside the image and closer than
%   R_max - 1 m, apparent radius >= 1.5 px, not behind a detection of this
%   image) misses; a tentative track (n_upd < n_confirm) is deleted at its
%   first miss, a confirmed one after n_miss consecutive misses. With
%   cfg.trk.oracle_assoc = true (ablation only, requires cfg.seg.oracle) the
%   ray-caster instance id selects the track slot instead.
%
%   Static landmarks (method §6): obstacles are assumed static; every
%   accepted measurement updates the track's position with a Kalman
%   update at t_meas (velocity identically zero). An obstacle that does
%   move is followed only through re-detection: its measurements leave
%   the gate, start a new track, and the old one is deleted after missed
%   detections once it is expected in view.
H = [eye(3), zeros(3)];
tk = cfg.trk;
info = struct('n_upd', 0, 'n_new', 0, 'n_rej', 0, 'n_del', 0, 'n_red', 0);
if tk.delay_comp
    t_meas = hdr.t_c;
else
    t_meas = t_now;
end
[pw, Rw] = dart_posebuf_lookup(pb, t_meas);
R_IC = Rw * cfg.cam.R_BC;
nd = numel(det);
Y = zeros(3, nd); RY = zeros(3, 3, nd);
for k = 1:nd
    cB = cfg.cam.p_BC + cfg.cam.R_BC * det(k).cC;
    Y(:, k) = pw + Rw * cB;                                % Eq. 12
    RY(:, :, k) = R_IC * det(k).RC * R_IC.' ...
        + (cfg.est.sigma_p^2 + (cfg.est.sigma_att * norm(cB))^2) * eye(3);
end

if tk.oracle_assoc
    [trk, info] = oracle_association(trk, det, Y, RY, t_meas, info, cfg);
    return
end

% ---------------------------------------------------- gating and costs
ids = find(trk.active & trk.t_upd <= t_meas);
nt = numel(ids);
C = inf(nt, nd);
for a = 1:nt
    [xm, Pm] = predict(trk, ids(a), t_meas, tk);
    tP = trace(Pm(1:3, 1:3));
    for k = 1:nd
        nu = Y(:, k) - xm(1:3);
        % exact prefilter: e >= |nu|^2 / lambda_max(S) >= |nu|^2 / trace(S)
        if nu.' * nu > tk.gate * (tP + trace(RY(:, :, k))), continue, end
        S = Pm(1:3, 1:3) + RY(:, :, k);
        [Lc, bad] = chol(S);
        if bad, continue, end
        z = Lc.' \ nu;
        e = z.' * z;
        if e <= tk.gate
            C(a, k) = e + 2 * sum(log(diag(Lc)));
        end
    end
end

% ---------------------------------------- greedy global nearest neighbour
asg = zeros(1, nd);                    % detection -> track slot
done = false(1, nt);
[cs, ord] = sort(C(:));
for q = 1:numel(ord)
    if ~isfinite(cs(q)), break, end
    [a, k] = ind2sub([nt, nd], ord(q));
    if done(a) || asg(k) > 0, continue, end
    asg(k) = ids(a);
    done(a) = true;
end

% --------------------------------------------------------------- updates
for k = 1:nd
    i = asg(k);
    if i > 0
        trk = update_track(trk, i, Y(:, k), RY(:, :, k), det(k), t_meas, H, tk);
        trk.n_miss(i) = 0;
        info.n_upd = info.n_upd + 1;
    end
end

% ------------------------------------------- missed detections, deletion
for a = find(~done)
    i = ids(a);
    if ~expected_visible(trk, i, t_meas, pw, Rw, det, cfg)
        continue
    end
    trk.n_miss(i) = trk.n_miss(i) + 1;
    if trk.n_upd(i) < tk.n_confirm || trk.n_miss(i) >= tk.n_miss
        trk.active(i) = false;
        trk.n_del = trk.n_del + 1;
        info.n_del = info.n_del + 1;
    end
end

% ------------------------------------- unassigned detections: new tracks
% (a detection whose sphere lies inside the sphere of an existing track adds
%  no occupied space - e.g. another cut of a large object - and is dropped)
act = find(trk.active);
Cact = zeros(3, numel(act));
for a = 1:numel(act)
    xa = dart_track_predict(trk, act(a), t_meas, cfg);
    Cact(:, a) = xa(1:3);
end
for k = find(asg == 0)
    if ~isempty(act)
        dk = sqrt(sum((Cact - Y(:, k)).^2, 1));
        if any(dk + det(k).rho <= trk.rho(act) + tk.contain_tol * det(k).rho)
            info.n_red = info.n_red + 1;
            continue
        end
    end
    i = free_slot(trk, t_meas, tk.n_confirm);
    trk = init_track(trk, i, Y(:, k), RY(:, :, k), det(k).rho, t_meas, cfg);
    trk.n_gate_rej = trk.n_gate_rej + 1;
    info.n_new = info.n_new + 1;
    info.n_rej = info.n_rej + 1;
end
end

% =====================================================================
function [trk, info] = oracle_association(trk, det, Y, RY, t_meas, info, cfg)
%ORACLE_ASSOCIATION Old assumption A6: slot = ray-caster instance id.
H = [eye(3), zeros(3)];
tk = cfg.trk;
for k = 1:numel(det)
    i = det(k).id;
    if i < 1 || i > numel(trk.active), continue, end
    if ~trk.active(i) || trk.n_rej(i) >= tk.max_reject || t_meas < trk.t_upd(i)
        trk = init_track(trk, i, Y(:, k), RY(:, :, k), det(k).rho, t_meas, cfg);
        info.n_new = info.n_new + 1;
        continue
    end
    [xm, Pm] = predict(trk, i, t_meas, tk);
    nu = Y(:, k) - xm(1:3);
    e = nu.' * ((Pm(1:3, 1:3) + RY(:, :, k)) \ nu);
    if e > tk.gate
        trk.n_rej(i) = trk.n_rej(i) + 1;
        trk.n_gate_rej = trk.n_gate_rej + 1;
        info.n_rej = info.n_rej + 1;
        continue
    end
    trk = update_track(trk, i, Y(:, k), RY(:, :, k), det(k), t_meas, H, tk);
    trk.n_rej(i) = 0;
    info.n_upd = info.n_upd + 1;
end
end

function trk = update_track(trk, i, y, Ry, d, t_meas, H, tk)
% Kalman update of the static landmark at t_meas (Eq. 23-25, Joseph form)
[xm, Pm] = predict(trk, i, t_meas, tk);
nu = y - H * xm;
S = H * Pm * H.' + Ry;
K = (Pm * H.') / S;                                       % Eq. 23
IKH = eye(6) - K * H;
trk.x(:, i) = xm + K * nu;                                % Eq. 24
trk.P(:, :, i) = IKH * Pm * IKH.' + K * Ry * K.';         % Eq. 25
trk.x(4:6, i) = 0;                                        % static: no velocity state
trk.P(4:6, :, i) = 0; trk.P(:, 4:6, i) = 0;
trk.t_upd(i) = t_meas;
trk.n_upd(i) = trk.n_upd(i) + 1;
if ~d.trunc
    a = tk.rho_alpha;
    trk.rho(i) = (1 - a) * trk.rho(i) + a * d.rho;
else
    trk.rho(i) = max(trk.rho(i), d.rho);
end
end

function vis = expected_visible(trk, i, t, pw, Rw, det, cfg)
%EXPECTED_VISIBLE The obstacle of track i should have produced a segment.
[x, ~] = dart_track_predict(trk, i, t, cfg);
R_IC = Rw * cfg.cam.R_BC;
o = pw + Rw * cfg.cam.p_BC;
pc = R_IC.' * (x(1:3) - o);
vis = false;
if pc(3) < 0.5 || pc(3) > cfg.cam.R_max - 1.0, return, end
fpx = (cfg.cam.W / 2) / tan(cfg.cam.hfov / 2);
u = fpx * pc(1) / pc(3); v = fpx * pc(2) / pc(3);
if abs(u) > cfg.cam.W / 2 - 2 || abs(v) > cfg.cam.H / 2 - 2, return, end
D = norm(pc);
al = asin(min(trk.rho(i) / D, 1));
if al * fpx < 1.5, return, end
ut = pc / D;
for k = 1:numel(det)                  % occluded by a detection in front of it?
    Dk = norm(det(k).cC);
    ak = asin(min(det(k).rho / Dk, 1));
    if acos(min(max(ut.' * det(k).cC / Dk, -1), 1)) < ak + al && Dk < D - trk.rho(i)
        return
    end
end
vis = true;
end

function i = free_slot(trk, t, n_confirm)
%FREE_SLOT First inactive slot; if the table is full, the stalest tentative
%   track, else the stalest track.
i = find(~trk.active, 1);
if ~isempty(i), return, end
age = t - trk.t_upd;
tent = trk.n_upd < n_confirm;
if any(tent)
    age(~tent) = -inf;
end
[~, i] = max(age);
end

function [x, P] = predict(trk, i, t, tk)
dt = t - trk.t_upd(i);
[F, Q] = dart_cv_model(dt, tk.q_static);
x = F * trk.x(:, i);
P = F * trk.P(:, :, i) * F.' + Q;
end

function trk = init_track(trk, i, y, Ry, rho, t, cfg)
trk.active(i) = true;
trk.x(:, i) = [y; 0; 0; 0];
trk.P(:, :, i) = blkdiag(Ry, cfg.trk.sigma_v_static^2 * eye(3));
trk.t_upd(i) = t;
trk.t_init(i) = t;
trk.rho(i) = rho;
trk.n_upd(i) = 1;
trk.n_rej(i) = 0;
trk.n_miss(i) = 0;
end
