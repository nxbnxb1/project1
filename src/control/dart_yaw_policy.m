function psi = dart_yaw_policy(psi_prev, v, p, goal, dt, cfg)
%DART_YAW_POLICY Point the (forward-looking) camera along the motion.
vh = v(1:2);
if norm(vh) > cfg.yaw.v_thresh
    psi_d = atan2(vh(2), vh(1));
else
    g = goal(1:2) - p(1:2);
    psi_d = atan2(g(2), g(1));
end
e = atan2(sin(psi_d - psi_prev), cos(psi_d - psi_prev));
step = cfg.yaw.rate_max * dt;
psi = psi_prev + min(max(e, -step), step);
psi = atan2(sin(psi), cos(psi));
end
