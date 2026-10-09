function [W, ok] = dart_detour_plan(p0, q, ob, cfg)
%DART_DETOUR_PLAN Shortest collision-free polyline from p0 to the rejoin point q.
%   Horizontal plan at the vehicle's altitude (the MPC keeps the full 3-D
%   constraints): every track becomes a disc (DART_DETOUR_DISCS); around
%   each disc ref.n_vert vertices are placed on the circumscribed regular
%   polygon (radius r_k / cos(pi / n_vert)), so the polygon edges keep the
%   clearance. Dijkstra on the
%   visibility graph {p0, vertices, q} gives the shortest path, i.e. the
%   fastest way back to the set path at cruise speed. Discs that contain
%   p0 or q are ignored for the edges at that end (the vehicle may already
%   be inside an inflated sphere; the MPC and the CBF handle it).
%   W  3 x K waypoints (W(:,1) = first waypoint after p0, W(:,end) = q);
%   ok false when no path exists (W = q: straight line).
rf = cfg.ref;
W = q; ok = false;
[C, r] = dart_detour_discs(p0, q, ob, cfg);
nd = numel(r);
if nd == 0
    ok = true; return
end
% ---- nodes: 1 = p0, 2 = q, then polygon vertices
nv = rf.n_vert;
ang = (0:nv - 1) * 2 * pi / nv;
V = zeros(2, nd * nv);
for k = 1:nd
    R = r(k) / cos(pi / nv);
    V(:, (k - 1) * nv + (1:nv)) = C(:, k) + R * [cos(ang); sin(ang)];
end
inside = false(1, size(V, 2));                % vertices inside another disc
for k = 1:nd
    inside = inside | sum((V - C(:, k)).^2, 1) < r(k)^2;
end
V = V(:, ~inside);
X = [p0(1:2), q(1:2), V];
n = size(X, 2);
% discs that contain p0 / q are ignored for edges at that end
in0 = sum((C - p0(1:2)).^2, 1) < r.^2;
inq = sum((C - q(1:2)).^2, 1) < r.^2;
% ---- visibility: segment (i, j) is free if it cuts no disc
[I, J] = find(triu(true(n), 1));
I = I.'; J = J.';
A = X(:, I); B = X(:, J);
D = B - A;
L2 = max(sum(D.^2, 1), 1e-12);
free = true(1, numel(I));
for k = 1:nd
    t = min(max(sum((C(:, k) - A) .* D, 1) ./ L2, 0), 1);
    dist2 = sum((A + D .* t - C(:, k)).^2, 1);
    hit = dist2 < r(k)^2 - 1e-9;
    if in0(k), hit = hit & I ~= 1 & J ~= 1; end
    if inq(k), hit = hit & I ~= 2 & J ~= 2; end
    free = free & ~hit;
end
I = I(free); J = J(free);
w = sqrt(sum((X(:, I) - X(:, J)).^2, 1));
% ---- Dijkstra from node 1 to node 2 (dense, n is small)
G = inf(n);
G(sub2ind([n n], I, J)) = w;
G(sub2ind([n n], J, I)) = w;
dist = inf(1, n); dist(1) = 0;
prev = zeros(1, n);
done = false(1, n);
for it = 1:n
    dd = dist; dd(done) = inf;
    [dm, u] = min(dd);
    if ~isfinite(dm) || u == 2, break, end
    done(u) = true;
    alt = dm + G(u, :);
    better = alt < dist & ~done;
    dist(better) = alt(better);
    prev(better) = u;
end
if ~isfinite(dist(2)), return, end
path = 2;
while path(1) ~= 1
    path = [prev(path(1)), path]; %#ok<AGROW>
end
P2 = X(:, path(2:end));
K = size(P2, 2);
s = cumsum([norm(P2(:, 1) - p0(1:2)), sqrt(sum(diff(P2, 1, 2).^2, 1))]);
zz = p0(3) + (q(3) - p0(3)) * s / max(s(end), 1e-9);
W = [P2; zz];
W(:, K) = q;
ok = true;
end
