function psi = dart_yaw_policy(psi_prev, v, p, target, dt, cfg, look)
%DART_YAW_POLICY Point the (forward-looking) camera along the motion.
%   target  point the vehicle is heading for (ctrl.target): the next detour
%           waypoint (REJOIN), Gamma(s0 + L_look) (TRACK) or the goal (R_GOAL)
%   look    the MPC's predicted position cfg.yaw.T_look ahead (optional)
%   The desired heading is the direction of the look-ahead displacement
%   (look - p) / T_look - the camera turns towards where the vehicle is
%   GOING, ahead of a turn of the planned path, instead of following the
%   current velocity v, which lags behind the turn and leaves the new
%   direction of motion unseen. Without a look point, or when that
%   displacement is shorter than v_thresh * T_look, the velocity v is used.
%   When this direction is slower than v_thresh or points AWAY from the
%   target (the vehicle backs away into space it has just observed), the
%   camera keeps looking at the target instead of turning around.
%   The yaw rate is limited to cfg.yaw.rate_max.
vh = v(1:2);
if nargin >= 7 && ~isempty(look) && norm(look(1:2) - p(1:2)) > cfg.yaw.v_thresh * cfg.yaw.T_look
    vh = (look(1:2) - p(1:2)) / cfg.yaw.T_look;
end
g = target(1:2) - p(1:2);
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
