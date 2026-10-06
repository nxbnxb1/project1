function depth_hat = dart_depth_network(depth, cfg, rs)
%DART_DEPTH_NETWORK Synthetic stand-in for a pretrained monocular depth
%   network g_theta followed by metric calibration (Eq. 8-9).
%   The output is the true depth corrupted by
%     - a per-frame residual scale error  (monocular scale ambiguity),
%     - a per-frame residual inverse-depth shift b (relative-depth networks
%       such as MiDaS / Depth Anything are affine-invariant in inverse
%       depth): 1/d_hat = 1/d_1 + b, so the error grows like b d^2,
%     - range-dependent per-pixel noise   (log-normal),
%     - a fraction of gross outliers.
%   Pixels without a valid depth stay Inf (also when the shifted inverse
%   depth falls below 1/(2 R_max), i.e. the pixel would read as "far").
valid = isfinite(depth);
n = numel(depth);
scale = cfg.depth.sigma_scale * dart_randn(rs, 1, 1);
shift = 0;
if cfg.depth.sigma_shift > 0          % no extra draw: default runs stay reproducible
    shift = cfg.depth.sigma_shift * dart_randn(rs, 1, 1);
end
sig = cfg.depth.sigma_px + cfg.depth.sigma_px_slope * depth;
noise = dart_randn(rs, 1, n);
out = dart_rand(rs, 1, n) < cfg.depth.p_outlier;
gross = 0.3 + 1.4 * dart_rand(rs, 1, n);      % multiplicative gross error
depth_hat = depth;
depth_hat(valid) = depth(valid) .* exp(scale + sig(valid) .* noise(valid));
if shift ~= 0
    z = 1 ./ depth_hat(valid) + shift;
    d1 = 1 ./ z;
    d1(z < 1 / (2 * cfg.cam.R_max)) = Inf;
    depth_hat(valid) = d1;
end
k = valid & out;
depth_hat(k) = depth(k) .* gross(k);
end
