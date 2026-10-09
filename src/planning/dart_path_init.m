function G = dart_path_init(W)
%DART_PATH_INIT Reference path (the mission's set trajectory) from waypoints.
%   W  3 x K waypoints. Consecutive duplicates are removed. The path is the
%   polyline through W, parametrised by arc length s in [0, G.L].
keep = [true, sqrt(sum(diff(W, 1, 2).^2, 1)) > 1e-9];
W = W(:, keep);
seg = sqrt(sum(diff(W, 1, 2).^2, 1));
G.W = W;
G.S = [0, cumsum(seg)];          % arc length at each waypoint
G.T = diff(W, 1, 2) ./ seg;      % unit tangent of each segment
G.L = G.S(end);
end
