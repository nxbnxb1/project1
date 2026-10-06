function test_safe_open_time()
% Revised scan-interval bound (Appendix A).
d_s = 0.5; a_b = 4;
% a_plus -> 0 recovers the original Eq. 39 bound M/vc
[T0, M] = dart_safe_open_time(6, 3, d_s, a_b, 0);
assert(abs(T0 - M / 3) < 1e-12);
T1 = dart_safe_open_time(6, 3, d_s, a_b, 1e-6);
assert(abs(T1 - T0) < 1e-4);
% finite for vc = 0, zero (emergency) for negative margin
assert(isfinite(dart_safe_open_time(6, 0, d_s, a_b, 2)));
assert(dart_safe_open_time(0.6, 3, d_s, a_b, 2) == 0);
% the root satisfies the worst-case stopping condition with equality
dc = 7; vc = 2.5; ap = 2;
T = dart_safe_open_time(dc, vc, d_s, a_b, ap);
lhs = vc * T + 0.5 * ap * T^2 + (vc + ap * T)^2 / (2 * a_b);
assert(abs(lhs - (dc - d_s)) < 1e-9);
% monotone: farther / slower -> longer interval
assert(dart_safe_open_time(9, vc, d_s, a_b, ap) > T);
assert(dart_safe_open_time(dc, 1.0, d_s, a_b, ap) > T);
end
