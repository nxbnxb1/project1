function psi = dart_yaw_policy(psi_prev, v, p, goal, dt, cfg)
%DART_YAW_POLICY Point the (forward-looking) camera along the motion.
%   When the vehicle backs away (velocity against the goal direction) it
%   moves into space it has just observed, so the camera keeps looking
%   toward the goal instead of turning around.
vh = v(1:2);
g = goal(1:2) - p(1:2);
if norm(vh) > cfg.yaw.v_thresh && vh.' * g >= 0
    psi_d = atan2(vh(2), vh(1));
else
    psi_d = atan2(g(2), g(1));
end
e = atan2(sin(psi_d - psi_prev), cos(psi_d - psi_prev));
step = cfg.yaw.rate_max * dt;
psi = psi_prev + min(max(e, -step), step);
psi = atan2(sin(psi), cos(psi));
end
