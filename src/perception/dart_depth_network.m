function depth_hat = dart_depth_network(depth, cfg, rs)
%DART_DEPTH_NETWORK Synthetic stand-in for a pretrained monocular depth
%   network g_theta followed by metric calibration (Eq. 8-9).
%   The output is the true depth corrupted by
%     - a per-frame residual scale error  (monocular scale ambiguity),
%     - range-dependent per-pixel noise   (log-normal),
%     - a fraction of gross outliers.
%   Pixels without a valid depth stay Inf.
valid = isfinite(depth);
n = numel(depth);
scale = cfg.depth.sigma_scale * dart_randn(rs, 1, 1);
sig = cfg.depth.sigma_px + cfg.depth.sigma_px_slope * depth;
noise = dart_randn(rs, 1, n);
out = dart_rand(rs, 1, n) < cfg.depth.p_outlier;
gross = 0.3 + 1.4 * dart_rand(rs, 1, n);      % multiplicative gross error
depth_hat = depth;
depth_hat(valid) = depth(valid) .* exp(scale + sig(valid) .* noise(valid));
k = valid & out;
depth_hat(k) = depth(k) .* gross(k);
end
