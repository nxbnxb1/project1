function D = dart_density_profile(res, R, step)
%DART_DENSITY_PROFILE Flight time, distance and perception frames of one
%   mission binned by the local obstacle density: the number of distinct
%   objects whose surface is within R metres of the vehicle (default 15).
%   D is 4 x 3: rows = bins {0, 1-2, 3-5, >= 6 objects}, columns =
%   [time s, distance flown m, frames]. Samples every 'step' log steps
%   (default 10); moving objects are evaluated at the sample time.
%   Mean speed of a bin = D(b,2) / D(b,1), frame rate = D(b,3) / D(b,1).
if nargin < 2 || isempty(R), R = 15; end
if nargin < 3 || isempty(step), step = 10; end
L = res.log; w = res.world;
n = numel(L.t);
idx = 1:step:n;
nxt = [idx(2:end), n];
dt = L.t(nxt) - L.t(idx);
v = sqrt(sum(L.x(4:6, idx).^2, 1));
fr = zeros(1, numel(idx));
c = [0, cumsum(L.trig(:).' > 0.5)];
for j = 1:numel(idx)
    last = max(nxt(j) - 1, idx(j));
    if j == numel(idx), last = n; end
    fr(j) = c(last + 1) - c(idx(j));
end
nob = zeros(1, numel(idx));
if ~isempty(w.type)
    P = L.x(1:3, idx);
    if any(w.v(:) ~= 0)
        for j = 1:numel(idx)
            Dj = dart_world_sdf(w, P(:, j), L.t(idx(j)));
            nob(j) = numel(unique(w.obj(Dj < R)));
        end
    else
        Dw = dart_world_sdf(w, P, 0);
        for j = 1:numel(idx)
            nob(j) = numel(unique(w.obj(Dw(:, j) < R)));
        end
    end
end
b = 1 + (nob >= 1) + (nob >= 3) + (nob >= 6);
D = zeros(4, 3);
for k = 1:4
    in = b == k;
    D(k, :) = [sum(dt(in)), sum(v(in) .* dt(in)), sum(fr(in))];
end
end
