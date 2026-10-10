function [depth_hat, depth_blur] = dart_depth_network(depth, cfg, rs)
%DART_DEPTH_NETWORK Synthetic stand-in for a small monocular depth network
%   (low-resolution output, metric calibration) on a cheap UAV.
%
%   depth   true optical-axis depth of the scene on the supersampled rays
%           (1 x (W ss * H ss), Inf = nothing hit), or on the pixel grid
%           (ss = 1). Returns the network's metric depth on the W x H
%           output grid (1 x (W*H), column-major; Inf = no depth).
%
%   Degradations, in the order a real pipeline produces them:
%   1. Pixel footprint: the network sees each pixel's AREA, not a single
%      ray. Disparity (inverse depth, what relative-depth networks predict)
%      is averaged over the ss x ss sub-rays of each pixel; an object
%      thinner than a pixel is mixed with the background behind it (free
%      space has disparity 0).
%   2. Network smoothing that grows with range ("the farther, the
%      blurrier"): Gaussian blur of the disparity image with
%        sigma_psf(d) = psf_px0 + psf_px1 * min(d / R_max, 1)   [px],
%      d the local depth. Thin or small far objects are diluted - their
%      disparity drops, so they read farther away than they are or vanish
%      (cf. MiDaS: "Thin structures can be missed", "Results tend to get
%      blurred in background regions ... in the far range").
%   3. Errors of the metric depth (log-normal in depth):
%        - per-frame scale error  eps_s ~ N(0, sigma_scale^2)
%        - smooth, spatially correlated error field, std sigma_corr
%          (bilinear interpolation of a corr_grid of N(0,1) nodes): local
%          biases that do NOT average out over an object's pixels
%        - per-pixel noise sigma_px(d) = sigma_px + sigma_px_slope * d
%      then a per-frame inverse-depth shift b ~ N(0, sigma_shift^2)
%      (relative-depth networks are affine-invariant in disparity; a
%      residual shift gives an error that grows like b d^2).
%   4. Haze (optional, cfg.depth.visibility V [m], Inf = clear air): a
%      pixel at depth d is lost (reads as background) with probability
%      1 - exp(-3.912 d / V) (Koschmieder contrast).
%   5. Gross outliers with probability p_outlier (factor U(0.3, 1.7)).
%   6. The pipeline keeps only depths <= R_max (reliable range).
%   depth_blur (optional) is the noise-free depth after steps 1-2.
W = cfg.cam.W; H = cfg.cam.H;
dp = cfg.depth;
ss = round(sqrt(numel(depth) / (W * H)));
% ---- 1. disparity averaged over the pixel footprint
q = 1 ./ depth;
q(~isfinite(depth) | depth <= 0) = 0;
Q = reshape(q, H * ss, W * ss);
if ss > 1
    Q = reshape(mean(mean(reshape(Q, ss, H, ss, W), 1), 3), H, W);
end
% ---- 2. range-dependent network blur (blend of two Gaussian blurs)
Qa = gblur(Q, dp.psf_px0);
Qb = gblur(Q, dp.psf_px0 + dp.psf_px1);
wf = min(1 ./ max(Qa, 1e-9) / cfg.cam.R_max, 1);       % local depth / R_max
Q = (1 - wf) .* Qa + wf .* Qb;
db = 1 ./ Q;
db(Q < 1e-9) = Inf;
% ---- 3. metric depth errors (all random draws are always made: the
%         number of draws does not depend on the options)
n = W * H;
e_s = dp.sigma_scale * dart_randn(rs, 1, 1);
b = dp.sigma_shift * dart_randn(rs, 1, 1);
g = dp.corr_grid;
nodes = dart_randn(rs, g(1), g(2));
[xu, yu] = meshgrid(linspace(1, g(2), W), linspace(1, g(1), H));
F = interp2(nodes, xu, yu, 'linear');
F = F(:).' / sqrt(mean(nodes(:).^2) + 1e-12) * (dp.sigma_corr > 0);
eps_p = dart_randn(rs, 1, n);
u_out = dart_rand(rs, 1, n);
gross = 0.3 + 1.4 * dart_rand(rs, 1, n);
u_haze = dart_rand(rs, 1, n);
d1 = db(:).';
ok = isfinite(d1);
sig = dp.sigma_px + dp.sigma_px_slope * d1;
dh = d1 .* exp(e_s + dp.sigma_corr * F + sig .* eps_p);
if b ~= 0
    z = 1 ./ dh + b;
    dh = 1 ./ z;
    dh(z <= 0) = Inf;
end
% ---- 4. haze
if isfinite(dp.visibility)
    ok = ok & u_haze >= 1 - exp(-3.912 * d1 / dp.visibility);
end
% ---- 5. outliers
k = ok & u_out < dp.p_outlier;
dh(k) = d1(k) .* gross(k);
% ---- 6. reliable range
dh(~ok | dh > cfg.cam.R_max) = Inf;
depth_hat = dh;
if nargout > 1
    depth_blur = d1;
end
end

function B = gblur(A, s)
%GBLUR Separable Gaussian blur with replicated borders.
if s <= 0, B = A; return, end
k = max(1, ceil(3 * s));
x = -k:k;
h = exp(-0.5 * (x / s).^2);
h = h / sum(h);
[H, W] = size(A);
Ap = A([ones(1, k), 1:H, H * ones(1, k)], [ones(1, k), 1:W, W * ones(1, k)]);
B = conv2(h(:), h(:).', Ap, 'valid');
end
