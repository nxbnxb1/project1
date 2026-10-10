function v = dart_clutter_speed(ob, rk, p, dir, cfg)
%DART_CLUTTER_SPEED Speed at which the CLOSING speed toward every obstacle
%   ahead can still be braked away: few obstacles -> fast, many -> slow.
%   Flying with speed v in direction dir, the closing speed toward obstacle
%   k is v cos(theta_k) (theta_k the angle between dir and the obstacle);
%   the braking condition of the scheduler and of the braking CBF,
%   v_c^2 <= 2 a_b (d^c_k - d_s), then gives for every obstacle ahead
%   (cos theta_k > 0)
%       v <= k_c sqrt(2 a_b max(d^c_k - d_s, 0)) / cos(theta_k),
%   with d^c the conservative surface distance (DART_RISK_TERMS) and
%   k_c = ref.clutter_k < 1 a margin below the emergency boundary. The limit
%   never goes below ref.v_clutter_min; Inf when nothing is ahead. The
%   braking CBF enforces the same condition on the current closing speed;
%   this limit makes the REFERENCE slow down in clutter beforehand, so the
%   safety filter and the emergency mode rarely have to intervene.
%   Only obstacles in a corridor along the current velocity count: miss
%   distance (DART_RISK_TERMS) < rho + d_s + beta_d sigma_r + ref.clutter_w
%   (an obstacle well beside the course is passed, not approached).
v = inf;
M = numel(ob.id);
if M == 0 || norm(dir) < 1e-6, return, end
dir = dir / norm(dir);
r = ob.c - p;
cth = (dir.' * r) ./ max(sqrt(sum(r.^2, 1)), 1e-6);
ahead = cth > 0.05 & rk.miss < ob.rho + cfg.sched.d_s + cfg.sched.beta_d * rk.sig_r + cfg.ref.clutter_w;
if ~any(ahead), return, end
vk = cfg.ref.clutter_k * sqrt(2 * cfg.sched.a_b * max(rk.dc(ahead) - cfg.sched.d_s, 0)) ./ cth(ahead);
v = max(min(vk), cfg.ref.v_clutter_min);
end
