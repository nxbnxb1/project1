function [blk, s_end, s_beg] = dart_path_blocked(G, s0, ob, cfg, s_from)
%DART_PATH_BLOCKED First stretch of the reference path ahead that is blocked.
%   The path is sampled every ref.ds from s0 to s0 + ref.L_look. A sample
%   is blocked if it lies inside the inflated sphere of a track,
%       || Gamma(s) - c_k(t_s) || < rho_k + d_s + beta_s sigma_k + ref.margin,
%   with the obstacle predicted (CV) to the time t_s = (s - s0) / v_des at
%   which the vehicle would reach the sample, sigma_k the largest position
%   std of the track (the same inflation as the MPC constraints, Eq. 82).
%   Blocked runs separated by less than ref.gap_merge are merged (no
%   rejoining in a gap the vehicle could not use). [s_beg, s_end] is the
%   first blocked run that ends at or after s_from (default s0).
rf = cfg.ref;
if nargin < 5, s_from = s0; end
blk = false; s_end = s0; s_beg = s0;
M = numel(ob.rho);
if M == 0 || s0 >= G.L, return, end
s = s0:rf.ds:min(s0 + rf.L_look, G.L);
P = dart_path_point(G, s);
ts = (s - s0) / rf.v_des;
B = false(1, numel(s));
for k = 1:M
    sig = sqrt(dart_lmax_sym3(ob.P(1:3, 1:3, k)));
    d = ob.rho(k) + cfg.sched.d_s + cfg.mpc.beta_s * sig + rf.margin;
    C = ob.c(:, k) + ob.v(:, k) * ts;
    B = B | sum((P - C).^2, 1) < d^2;
end
% blocked runs [a(r), b(r)] (sample indices), merged across short gaps
d = diff([false, B, false]);
a = find(d == 1); b = find(d == -1) - 1;
r = 1;
while r < numel(a)
    if s(a(r + 1)) - s(b(r)) < rf.gap_merge
        b(r) = b(r + 1); a(r + 1) = []; b(r + 1) = [];
    else
        r = r + 1;
    end
end
r = find(s(b) >= s_from - 1e-9, 1);
if isempty(r), return, end
blk = true;
s_beg = s(a(r));
s_end = s(b(r));
end
