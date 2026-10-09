function [pr, vr] = dart_reference(p0, goal, N, dt, v_des, a_dec)
%DART_REFERENCE Goal-directed reference over the horizon (x_ref in Eq. 87).
%   Used only with ref.mode = 'goal' (variant R_GOAL); the default reference
%   follows the set path (DART_REFERENCE_PATH).
%   A "carrot" that starts at the current position and moves straight to
%   the goal with speed min(v_des, sqrt(2 a_dec s_remaining)).
e = goal - p0;
dist = norm(e);
if dist < 1e-6
    pr = repmat(p0, 1, N); vr = zeros(3, N); return
end
e = e / dist;
pr = zeros(3, N); vr = zeros(3, N);
s = 0;
for j = 1:N
    vm = min(v_des, sqrt(2 * a_dec * max(dist - s, 0)));
    s = min(s + vm * dt, dist);
    vm = min(v_des, sqrt(2 * a_dec * max(dist - s, 0)));
    pr(:, j) = p0 + s * e;
    vr(:, j) = vm * e;
end
end
