function cfg = dart_derive_limits(cfg)
%DART_DERIVE_LIMITS Physical limits of the outer loop derived from the
%   quadrotor model (rigid body, collective thrust f <= f_max, linear rotor
%   drag kd and quadratic body drag cq), instead of hand-set numbers.
%
%   thrust-to-weight      TW = f_max / (m g)
%   tilt limit            level flight at tilt theta needs f = m g / cos(theta);
%                         a thrust reserve eta for attitude control gives
%                         cos(theta_max) = 1 / ((1 - eta) TW)
%   horizontal accel.     a_h = g tan(theta_max)            (level flight)
%   per-axis box          a_xy = a_h / sqrt(2)  (the box diagonal stays in the tilt cone)
%   vertical accel.       a_z = (1 - eta) TW g - g          (with the same reserve)
%   guaranteed braking    a_b = k_b (a_xy - a_bar_o - delta_a)   (CBF feasibility, A5)
%   top speed             m a_h = kd v + cq v^2  ->  v_term;  v_max = k_v v_term
%   camera view limit     in cruise the vehicle pitches forward by
%                         theta(v) = atan((kd v + cq v^2) / (m g)); the path
%                         ahead stays in view while theta(v) <= uptilt +
%                         vfov/2 - view_margin  ->  v_view;  v_max <= v_view
%   The derived values overwrite quad.tilt_max, mpc.a_max, mpc.v_max(1:2) and
%   sched.a_b; cfg.lim records them. Called at the end of DART_DEFAULT_CONFIG
%   (call again after changing quad.* parameters).
q = cfg.quad;
g = q.g; m = q.m;
TW = q.f_max / (m * g);
c = min(1, 1 / ((1 - q.thrust_reserve) * TW));
theta = acos(c);
a_h = g * tan(theta);
a_xy = a_h / sqrt(2);
a_z = max((1 - q.thrust_reserve) * TW * g - g, 0.5);
if q.cq > 0
    v_term = (-q.kd + sqrt(q.kd^2 + 4 * q.cq * m * a_h)) / (2 * q.cq);
else
    v_term = m * a_h / q.kd;
end
v_max = q.speed_frac * v_term;
v_view = inf;
if isfield(cfg.cam, 'uptilt')
    fpx = (cfg.cam.W / 2) / tan(cfg.cam.hfov / 2);
    th_vis = cfg.cam.uptilt + atan((cfg.cam.H / 2) / fpx) - q.view_margin;
    Fv = m * g * tan(max(th_vis, 0));            % drag force at the visible pitch limit
    if q.cq > 0
        v_view = (-q.kd + sqrt(q.kd^2 + 4 * q.cq * Fv)) / (2 * q.cq);
    else
        v_view = Fv / q.kd;
    end
end
v_max = min(v_max, v_view);
a_b = q.brake_frac * (a_xy - cfg.cbf.a_bar_o - cfg.cbf.delta_a);
cfg.quad.tilt_max = theta;
cfg.mpc.a_max = [a_xy; a_xy; a_z];
cfg.mpc.v_max(1:2) = v_max;
cfg.sched.a_b = a_b;
cfg.lim = struct('TW', TW, 'tilt_deg', theta * 180 / pi, 'a_h', a_h, 'a_xy', a_xy, 'a_z', a_z, ...
    'a_b', a_b, 'v_term', v_term, 'v_view', v_view, 'v_max', v_max);
end
