function [d, n, q] = dart_cyl_dist(P, c, rho, zl, zh)
%DART_CYL_DIST Signed distance from points to a vertical cylinder.
%   The obstacle model (method §5): axis through c(1:2), horizontal radius
%   rho, vertical extent [zl, zh] (zl = -Inf: down to the ground / unknown
%   bottom, zh = Inf: unknown top). P is 3 x n. Returns the distance d
%   (1 x n; negative inside), the outward unit normal n (3 x n, gradient of
%   d) and the closest surface point q (3 x n). An obstacle inflated by a
%   margin m (Minkowski sum with a ball) is exactly {x : d(x) < m}.
np = size(P, 2);
x = P(1, :) - c(1); y = P(2, :) - c(2); z = P(3, :);
rh = sqrt(x.^2 + y.^2);
small = rh < 1e-9;
ux = x ./ max(rh, 1e-9); uy = y ./ max(rh, 1e-9);
ux(small) = 1; uy(small) = 0;
dh = rh - rho;                                  % horizontal: > 0 outside the circle
dlo = zl - z; dhi = z - zh;                     % > 0 below the bottom / above the top
up = dhi >= dlo;
dv = max(dlo, dhi);                             % vertical: > 0 outside the band
sv = 2 * up - 1;                                % +1 nearest face is the top, -1 the bottom
zf = zl * ones(1, np); zf(up) = zh;             % nearest cap height
zf = min(max(zf, -1e6), 1e6);
d = zeros(1, np); n = zeros(3, np); q = zeros(3, np);
A = dv <= 0 & dh >= 0;                          % beside, within the height
B = dv > 0 & dh < 0;                            % above / below, within the radius
C = dv > 0 & dh >= 0;                           % beyond a rim
D = dv <= 0 & dh < 0;                           % inside
d(A) = dh(A);
n(:, A) = [ux(A); uy(A); zeros(1, nnz(A))];
q(:, A) = [c(1) + rho * ux(A); c(2) + rho * uy(A); z(A)];
d(B) = dv(B);
n(:, B) = [zeros(2, nnz(B)); sv(B)];
q(:, B) = [P(1:2, B); zf(B)];
dc = sqrt(dh(C).^2 + dv(C).^2);
d(C) = dc;
n(:, C) = [dh(C) .* ux(C); dh(C) .* uy(C); dv(C) .* sv(C)] ./ max(dc, 1e-12);
q(:, C) = [c(1) + rho * ux(C); c(2) + rho * uy(C); zf(C)];
side = D & dh >= dv;                            % inside, nearer the mantle
cap = D & ~side;                                % inside, nearer a cap
d(D) = max(dh(D), dv(D));
n(:, side) = [ux(side); uy(side); zeros(1, nnz(side))];
q(:, side) = [c(1) + rho * ux(side); c(2) + rho * uy(side); z(side)];
n(:, cap) = [zeros(2, nnz(cap)); sv(cap)];
q(:, cap) = [P(1:2, cap); zf(cap)];
end
