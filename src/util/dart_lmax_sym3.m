function l = dart_lmax_sym3(P)
%DART_LMAX_SYM3 Largest eigenvalue of a symmetric 3x3 matrix (closed form).
P = 0.5 * (P + P.');
p1 = P(1,2)^2 + P(1,3)^2 + P(2,3)^2;
q = (P(1,1) + P(2,2) + P(3,3)) / 3;
if p1 < 1e-18
    l = max([P(1,1), P(2,2), P(3,3)]);
    return
end
p2 = (P(1,1) - q)^2 + (P(2,2) - q)^2 + (P(3,3) - q)^2 + 2 * p1;
p = sqrt(p2 / 6);
B = (P - q * eye(3)) / p;
r = det(B) / 2;
r = min(max(r, -1), 1);
phi = acos(r) / 3;
l = q + 2 * p * cos(phi);
end
