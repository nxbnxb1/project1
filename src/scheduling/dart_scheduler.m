function [ss, out] = dart_scheduler(ss, ob, rk, p, v, R_IB, t, cfg)
%DART_SCHEDULER Safety-driven adaptive perception scheduling (Sec. 6).
%   ss  scheduler state: t_last (last capture), awaiting (frame in flight),
%       tau_m / tau_v (latency statistics), emerg_until
%   out.trigger   start a depth inference now
%   out.T_scan    scheduled scan interval (Eq. 40-41)
%   out.emergency emergency flag (Eq. 45, revised)
%   out.tau_hat   conservative latency estimate
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
Topen = inf(1, M);
Mmarg = inf(1, M);
for k = 1:M
    dc = rk.dc(k);
    [Tk, Mk] = dart_safe_open_time(dc, rk.vcb(k), sc.d_s, sc.a_b, a_known);
    for it = 1:sc.fixpoint_iter
        % uncertainty is larger at the END of the open interval
        Tp = Tk;
        [F, Q] = dart_cv_model(Tp, dart_ob_q(ob, k, cfg));
        Pf = F * ob.P(:, :, k) * F.' + Q;
        sig_end = sqrt(dart_lmax_sym3(Pf(1:3, 1:3) + cfg.est.sigma_p^2 * eye(3)));
        dc_end = rk.d(k) - ob.rho(k) - sc.beta_d * sig_end;
        [Tk, Mk] = dart_safe_open_time(min(dc, dc_end), rk.vcb(k), sc.d_s, sc.a_b, a_known);
    end
    Topen(k) = Tk;
    Mmarg(k) = Mk;
end

% ---- frontier: an unseen obstacle may sit just beyond the sensing range
T_front = inf;
if sc.frontier
    dcF = cfg.cam.R_max - sc.frontier_margin;
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
urgent = any(closing & (Topen < tau_hat)) || T_front < tau_hat;
if any(closing & (Mmarg <= 0))
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
if strcmp(sc.mode, 'fixed')
    T_scan = 1 / sc.f_fixed;
    trig = idle && (t - ss.t_last >= T_scan - 1e-9);
else
    ev_time = t - ss.t_last >= T_scan - 1e-9;                         % Eq. 46
    ev_dist = any(vis & (rk.dc <= sc.d_trig));                        % Eq. 47
    ev_sig  = any(vis & (rk.sig_r >= sc.sigma_trig));                 % Eq. 48
    trig = idle && (ev_time || ev_dist || ev_sig || urgent || emergency);
end
if trig
    ss.t_last = t;
    ss.awaiting = true;
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
