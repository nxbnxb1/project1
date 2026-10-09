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
%   Association (Sec. 5.2). The detections carry no identity: their id is
%   only the index of a segment in that image. Every active track is
%   predicted to t_meas with its selected model; a detection k may be
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
%   Two-model bank (Sec. 5.3): every accepted measurement updates both the
%   constant-velocity filter (x, P, q_acc) and the stationary filter
%   (xs, Ps, q_static). Gating uses the currently selected model. The
%   probability mu of the stationary model is propagated as in an IMM
%   (Markov switching probability p_switch, Bayes update with the two
%   innovation likelihoods) without state mixing. The track is classified
%   static once it has been observed for T_static seconds with at least
%   n_static updates, mu >= mu_static and the CV speed estimate is small
%   (<= v_static); with hysteresis, it reverts to dynamic when
%   mu < mu_revert or the CV speed exceeds v_revert.
H = [eye(3), zeros(3)];
tk = cfg.trk;
info = struct('n_upd', 0, 'n_new', 0, 'n_rej', 0, 'n_del', 0);
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
    [xm, Pm] = predict_sel(trk, ids(a), t_meas, tk);
    for k = 1:nd
        nu = Y(:, k) - xm(1:3);
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
for k = find(asg == 0)
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
    [xm, Pm] = predict_sel(trk, i, t_meas, tk);
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
% ---- accepted: update both models (a model whose own innovation is
%      outside the gate is restarted at the measurement instead)
dt = t_meas - trk.t_upd(i);
[xm, Pm] = predict(trk.x(:, i), trk.P(:, :, i), dt, tk.q_acc);        % CV prior at t_c
[xsm, Psm] = predict(trk.xs(:, i), trk.Ps(:, :, i), dt, tk.q_static);
nu = y - H * xm;   S = H * Pm * H.' + Ry;
nus = y - H * xsm; Ss = H * Psm * H.' + Ry;
e = nu.' * (S \ nu);
es = nus.' * (Ss \ nus);
% model probability of "stationary" (IMM-style, no mixing)
mu = (1 - tk.p_switch) * trk.mu(i) + tk.p_switch * (1 - trk.mu(i));
lr = exp(-0.5 * (es - e)) * prod(diag(chol(S))) / prod(diag(chol(Ss)));  % Lambda_s / Lambda_cv
trk.mu(i) = mu * lr / (mu * lr + 1 - mu);
if e <= tk.gate
    [trk.x(:, i), trk.P(:, :, i)] = update(xm, Pm, nu, S, Ry, H);       % Eq. 23-25
else
    [trk.x(:, i), trk.P(:, :, i)] = prior(y, Ry, tk.sigma_v0);
end
if es <= tk.gate
    [trk.xs(:, i), trk.Ps(:, :, i)] = update(xsm, Psm, nus, Ss, Ry, H);
else
    [trk.xs(:, i), trk.Ps(:, :, i)] = prior(y, Ry, tk.sigma_v_static);
    trk.mu(i) = 0;                    % the stationary model has just failed
end
trk.t_upd(i) = t_meas;
trk.n_upd(i) = trk.n_upd(i) + 1;
spd = norm(trk.x(4:6, i));
if trk.static(i)
    trk.static(i) = trk.mu(i) >= tk.mu_revert && spd <= tk.v_revert;
else
    trk.static(i) = tk.static_cls && trk.n_upd(i) >= tk.n_static ...
        && t_meas - trk.t_init(i) >= tk.T_static ...
        && trk.mu(i) >= tk.mu_static && spd <= tk.v_static;
end
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

function [x, P] = predict_sel(trk, i, t, tk)
dt = t - trk.t_upd(i);
if trk.static(i)
    [x, P] = predict(trk.xs(:, i), trk.Ps(:, :, i), dt, tk.q_static);
else
    [x, P] = predict(trk.x(:, i), trk.P(:, :, i), dt, tk.q_acc);
end
end

function [x, P] = predict(x, P, dt, q)
[F, Q] = dart_cv_model(dt, q);
x = F * x;
P = F * P * F.' + Q;
end

function [x, P] = update(xm, Pm, nu, S, Ry, H)
K = (Pm * H.') / S;                                       % Eq. 23
IKH = eye(6) - K * H;
x = xm + K * nu;                                          % Eq. 24
P = IKH * Pm * IKH.' + K * Ry * K.';                      % Eq. 25 (Joseph)
end

function [x, P] = prior(y, Ry, sigma_v)
x = [y; 0; 0; 0];
P = blkdiag(Ry, sigma_v^2 * eye(3));
end

function trk = init_track(trk, i, y, Ry, rho, t, cfg)
trk.active(i) = true;
[trk.x(:, i), trk.P(:, :, i)] = prior(y, Ry, cfg.trk.sigma_v0);
[trk.xs(:, i), trk.Ps(:, :, i)] = prior(y, Ry, cfg.trk.sigma_v_static);
trk.static(i) = false;
trk.mu(i) = 0.5;
trk.t_upd(i) = t;
trk.t_init(i) = t;
trk.rho(i) = rho;
trk.n_upd(i) = 1;
trk.n_rej(i) = 0;
trk.n_miss(i) = 0;
end
