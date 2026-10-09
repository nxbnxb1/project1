function psi = dart_yaw_policy(psi_prev, v, p, goal, dt, cfg, look)
%DART_YAW_POLICY Point the (forward-looking) camera along the motion.
%   With a look point (the MPC's predicted position cfg.yaw.T_look ahead)
%   the camera turns towards where the vehicle is GOING, ahead of a turn of
%   the planned path, instead of following the current velocity (which
%   lags behind the turn and leaves the new direction of motion unseen).
%   When the vehicle backs away (velocity against the goal direction) it
%   moves into space it has just observed, so the camera keeps looking
%   toward the goal instead of turning around.
vh = v(1:2);
if nargin >= 7 && ~isempty(look) && norm(look(1:2) - p(1:2)) > cfg.yaw.v_thresh * cfg.yaw.T_look
    vh = (look(1:2) - p(1:2)) / cfg.yaw.T_look;
end
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
