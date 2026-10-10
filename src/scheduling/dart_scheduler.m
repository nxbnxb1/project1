function [ss, out] = dart_scheduler(ss, ob, rk, p, v, R_IB, t, cfg, path)
%DART_SCHEDULER Safety-driven adaptive perception scheduling (method §8).
%   ss  scheduler state: t_last (last capture), awaiting (frame in flight),
%       tau_m / tau_v (latency statistics), emerg_until
%   out.trigger   start a depth inference now
%   out.T_scan    scheduled scan interval (Eq. 40-41)
%   out.emergency emergency flag (Eq. 45, revised)
%   out.tau_hat   conservative latency estimate
%   path          3 x K planned positions ahead (MPC prediction), used by
%                 the coverage scheduler (sched.mode = 'coverage'):
%       the obstacles are static, so a frame is needed only when the
%       planned path ahead - up to the distance needed to stop after the
%       next result, v (tau_hat + cov_react) + v^2 / (2 a_b) + d_s - is no
%       longer inside the space observed by the recent frames (their view
%       frusta, shrunk by cov_margin and by the clearance d_s, up to the
%       reliable range R_eff of DART_PERCEPTION_RANGE). Known obstacles do
%       not trigger frames because they are close (they stay in the
%       memory); the uncertainty (information-gain) and emergency events
%       are kept (sched.cov_events = true also keeps the distance event).
sc = cfg.sched;
tau_hat = ss.tau_m + sc.tau_quantile_k * sqrt(max(ss.tau_v, 0));
% worst-case growth of the closing speed during the open interval:
%  - known obstacle : only its own (unmodelled) acceleration a_bar_o; the
%    vehicle cannot accelerate toward it beyond the stopping condition
%    because the CBF filter enforces exactly that condition at f_c
%  - frontier       : the vehicle itself may still accelerate (a_plus)
a_known = cfg.cbf.a_bar_o;
a_front = sc.a_plus;
M = numel(ob.id);

% ---- visibility: only obstacles the camera can actually re-observe drive
%      the scan interval; the others are handled by inflation + CBF.
vis = false(1, M);
if M > 0
    vis = dart_in_fov(ob.c, p, R_IB, cfg);
end

% ---- per-obstacle maximum safe open-loop time with covariance growth
%      (sc.uncertainty = false: deterministic braking-based tolerable time
%      on the point estimate, as in Zhuyi-style rate estimation; baseline)
Topen = inf(1, M);
Mmarg = inf(1, M);
for k = 1:M
    if sc.uncertainty
        dc = rk.dc(k); vcb = rk.vcb(k); nfp = sc.fixpoint_iter;
    else
        dc = rk.d(k) - ob.rho(k); vcb = rk.vc(k); nfp = 0;
    end
    [Tk, Mk] = dart_safe_open_time(dc, vcb, sc.d_s, sc.a_b, a_known);
    for it = 1:nfp
        % uncertainty is larger at the END of the open interval
        Tp = Tk;
        [F, Q] = dart_cv_model(Tp, dart_ob_q(ob, k, cfg));
        Pf = F * ob.P(:, :, k) * F.' + Q;
        sig_end = sqrt(dart_lmax_sym3(Pf(1:3, 1:3) + cfg.est.sigma_p^2 * eye(3)));
        dc_end = rk.d(k) - ob.rho(k) - sc.beta_d * sig_end;
        [Tk, Mk] = dart_safe_open_time(min(dc, dc_end), vcb, sc.d_s, sc.a_b, a_known);
    end
    Topen(k) = Tk;
    Mmarg(k) = Mk;
end

% ---- frontier: an unseen obstacle may sit just beyond the sensing range
T_front = inf;
if sc.frontier
    dcF = min(cfg.cam.R_max - sc.frontier_margin, dart_perception_range(cfg));   % reliable range
    T_front = dart_safe_open_time(dcF, norm(v) + sc.v_unknown, sc.d_s, sc.a_b, a_front);
end

Tvis = [Topen(vis), T_front];
T_star = min(Tvis);
T_scan = min(max(T_star - tau_hat, sc.T_min), sc.T_max);

% ---- two-level response for obstacles that are actually closing in
%      (sliding along the safety boundary, v_c ~ 0, is left to the CBF):
%      urgent : T_open* < tau_hat -> a frame started now arrives too late
%               for the planned open interval -> capture immediately (Eq. 45)
%      emergency: stopping margin M < 0 -> even immediate braking cannot keep
%               d_s under the conservative estimate -> braking mode
closing = rk.vc > sc.v_closing;
urgent = any(vis & closing & (Topen < tau_hat)) || T_front < tau_hat;   % only re-observable obstacles
% emergency only for obstacles on a collision course (passing beside an
% obstacle has a positive closing speed toward its centre but no collision)
oncourse = rk.miss < ob.rho + sc.d_s + sc.beta_d * rk.sig_r + sc.course_margin;
if any(closing & oncourse & (Mmarg <= 0))
    ss.emerg_until = t + sc.emergency_hold;
end
emergency = sc.emergency_enabled && (t < ss.emerg_until);
% speed at which the closest closing obstacle can still be stopped for
% (used to cap the MPC reference speed in emergency mode)
v_cap = inf;
if any(closing)
    v_cap = sqrt(2 * sc.a_b * max(min(rk.dc(closing)) - sc.d_s, 0));
end

% ---- trigger logic
idle = ~ss.awaiting;
ev_cov = false;
if strcmp(sc.mode, 'fixed')
    T_scan = 1 / sc.f_fixed;
    trig = idle && (t - ss.t_last >= T_scan - 1e-9);
elseif strcmp(sc.mode, 'coverage')
    if nargin < 9, path = zeros(3, 0); end
    need = norm(v) * (tau_hat + sc.cov_react) + norm(v)^2 / (2 * sc.a_b) + sc.d_s;
    ev_cov = ~path_covered(ss, p, v, path, need, cfg);
    % known static obstacles are not re-imaged because they are close
    % (cov_events = true restores the distance event); the information-gain
    % gated uncertainty event is kept: an obstacle first seen far away keeps
    % a large covariance (inflated sphere) until it is measured again from
    % closer, and without that measurement the inflated spheres can close
    % the gaps of a cluster for good
    ev_dist = sc.cov_events && any(vis & (rk.dc <= sc.d_trig));
    ev_sig = sigma_event(ob, rk, vis, cfg);
    T_scan = sc.T_max;                 % nominal (horizon and expected covariance reset only)
    trig = idle && (ev_cov || ev_dist || ev_sig || emergency);
else
    ev_time = t - ss.t_last >= T_scan - 1e-9;                         % Eq. 46
    ev_dist = any(vis & (rk.dc <= sc.d_trig));                        % Eq. 47
    % Eq. 48, gated by information gain: a new frame is only worth it if the
    % predicted variance clearly exceeds the variance of the measurement
    % expected at that range (otherwise the posterior hardly shrinks), and
    % only for obstacles close enough to matter for the safety layer
    ev_sig = false;
    if sc.uncertainty
        for k = find(vis & (rk.sig_r >= sc.sigma_trig) & (rk.dc < cfg.cbf.d_active))
            Rv = dart_expected_meas_cov(rk.d(k), ob.rho(k), cfg);
            if rk.sig_r(k)^2 >= sc.info_gain * Rv(1, 1)
                ev_sig = true; break
            end
        end
    end
    trig = idle && (ev_time || ev_dist || ev_sig || urgent || emergency);
end
if trig
    if strcmp(sc.mode, 'fixed')
        why = [0 0 0 0 0 1];
    elseif strcmp(sc.mode, 'coverage')
        why = double([ev_cov, ev_dist, ev_sig, false, emergency, false]);
    else
        why = double([ev_time, ev_dist, ev_sig, urgent, emergency, false]);
    end
    ss.n_why = ss.n_why + why;
    ss.t_last = t;
    ss.awaiting = true;
    % observed space: view frustum of this frame (kept for the coverage test)
    ss.cov_o = [ss.cov_o, p + R_IB * cfg.cam.p_BC];
    ss.cov_R = cat(3, ss.cov_R, R_IB * cfg.cam.R_BC);
    if size(ss.cov_o, 2) > sc.cov_frames
        ss.cov_o = ss.cov_o(:, end - sc.cov_frames + 1:end);
        ss.cov_R = ss.cov_R(:, :, end - sc.cov_frames + 1:end);
    end
    ss.n_trig = ss.n_trig + 1;
end

out.trigger = trig;
out.T_scan = T_scan;
out.T_star = T_star;
out.T_front = T_front;
out.emergency = emergency;
out.urgent = urgent;
out.v_cap = v_cap;
out.tau_hat = tau_hat;
out.vis = vis;
end

% =====================================================================
function ev = sigma_event(ob, rk, vis, cfg)
%SIGMA_EVENT Eq. 48 gated by information gain (see the adaptive branch).
sc = cfg.sched;
ev = false;
for k = find(vis & (rk.sig_r >= sc.sigma_trig) & (rk.dc < cfg.cbf.d_active))
    Rv = dart_expected_meas_cov(rk.d(k), ob.rho(k), cfg);
    if rk.sig_r(k)^2 >= sc.info_gain * Rv(1, 1)
        ev = true; return
    end
end
end

function ok = path_covered(ss, p, v, path, need, cfg)
%PATH_COVERED The planned path from 1 m ahead up to the distance 'need' lies
%   in the observed space of the recent frames (with clearance d_s).
sc = cfg.sched;
ok = false;
if isempty(ss.cov_o), return, end
l0 = 1.0;                                   % closer points: inside the clearance anyway
ok = true;
if need <= l0, return, end
X = [p, path];
seg = sqrt(sum(diff(X, 1, 2).^2, 1));
keep = [true, seg > 1e-6];
X = X(:, keep); seg = seg(seg > 1e-6);
if isempty(seg)                             % no path: straight along the velocity
    if norm(v) < 1e-3, return, end
    X = [p, p + v / norm(v) * need]; seg = need;
end
L = sum(seg);
if L < need                                 % extend along the last direction
    dlast = (X(:, end) - X(:, end - 1)) / seg(end);
    X = [X, X(:, end) + dlast * (need - L)];
    seg = [seg, need - L];
end
cs = [0, cumsum(seg)];
s = l0:sc.cov_ds:need;
P = zeros(3, numel(s));
for a = 1:3
    P(a, :) = interp1(cs, X(a, :), s, 'linear');
end
R_eff = dart_perception_range(cfg);
fpx = (cfg.cam.W / 2) / tan(cfg.cam.hfov / 2);
th = cfg.cam.hfov / 2 - sc.cov_margin;
tv = atan((cfg.cam.H / 2) / fpx) - sc.cov_margin;
cov = false(1, numel(s));
for k = 1:size(ss.cov_o, 2)
    c = ss.cov_R(:, :, k).' * (P - ss.cov_o(:, k));
    z = c(3, :);
    in = z > 0.3 & z <= R_eff ...
        & abs(c(1, :)) + sc.d_s / cos(th) <= tan(th) * z ...
        & abs(c(2, :)) + sc.d_s / cos(tv) <= tan(tv) * z;
    cov = cov | in;
    if all(cov), return, end
end
ok = all(cov);
end

