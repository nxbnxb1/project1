function [s, e] = dart_path_project(G, p, s_lo, s_hi)
%DART_PATH_PROJECT Arc length of the path point closest to p within [s_lo, s_hi].
%   e is the distance from p to that point (cross-track error). The window
%   keeps the progress local when the path comes back near itself.
s_lo = max(s_lo, 0); s_hi = min(s_hi, G.L);
s = s_lo; e = inf;
for k = 1:numel(G.S) - 1
    a = max(G.S(k), s_lo); b = min(G.S(k + 1), s_hi);
    if a > b, continue, end
    sk = G.S(k) + G.T(:, k).' * (p - G.W(:, k));
    sk = min(max(sk, a), b);
    q = G.W(:, k) + G.T(:, k) * (sk - G.S(k));
    if norm(p - q) < e
        e = norm(p - q); s = sk;
    end
end
end
