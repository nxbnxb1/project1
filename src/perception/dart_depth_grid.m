function G = dart_depth_grid(depth_hat, cfg)
%DART_DEPTH_GRID Coarse free-space depth map of one network depth image.
%   The image is cut into a fixed grid of cells (DART_MSG_SIZE, 18 x 32);
%   each cell holds a low quantile (cfg.sched.grid_q) of the valid depths in
%   it, i.e. the depth up to which the space seen through that cell is free
%   (robust to single outlier pixels). A cell with fewer than
%   cfg.sched.grid_minvalid of valid pixels holds Inf (nothing within R_max).
%   Used by the coverage scheduler as observed free space.
[~, ~, gs] = dart_msg_size();
H = cfg.cam.H; W = cfg.cam.W;
[v, u] = ndgrid(1:H, 1:W);
iv = min(gs(1), ceil(v(:) * gs(1) / H));
iu = min(gs(2), ceil(u(:) * gs(2) / W));
cell = sub2ind(gs, iv, iu);
d = depth_hat(:);
ok = isfinite(d);
G = inf(gs);
ntot = accumarray(cell, 1, [prod(gs), 1]);
if any(ok)
    vals = accumarray(cell(ok), d(ok), [prod(gs), 1], @(x) lowq(x, cfg.sched.grid_q), Inf);
    nval = accumarray(cell(ok), 1, [prod(gs), 1]);
    use = nval >= cfg.sched.grid_minvalid * ntot;
    G(use) = vals(use);
end
end

function q = lowq(x, p)
x = sort(x);
q = x(max(1, ceil(p * numel(x))));
end
