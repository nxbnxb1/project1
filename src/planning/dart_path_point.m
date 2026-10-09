function [p, tg] = dart_path_point(G, s)
%DART_PATH_POINT Points and unit tangents of the reference path at arc lengths s.
s = min(max(s(:).', 0), G.L);
n = numel(s);
k = ones(1, n);
for j = 2:numel(G.S) - 1
    k(s >= G.S(j)) = j;          % segment index
end
p = G.W(:, k) + G.T(:, k) .* (s - G.S(k));
tg = G.T(:, k);
end
