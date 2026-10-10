function [lab, n] = dart_segment_depth(depth_hat, cam, cfg)
%DART_SEGMENT_DEPTH Obstacle segmentation from the (noisy) depth image only.
%   The vehicle receives no instance labels. Obstacles are found as
%   connected regions of valid depth in which neighbouring pixels have a
%   similar depth (the simulated scene contains obstacles in front of free
%   space; pixels beyond R_max carry no depth):
%     1. log-depth L = log(depth_hat) on the valid pixels;
%     2. Lm = (lower) median of L over the valid pixels of the 3x3
%        neighbourhood;
%        a pixel with |L - Lm| > seg.tau_out is a gross outlier and is
%        dropped (it is neither segmented nor used by the extraction);
%     3. 8-connected components of the remaining pixels, where neighbours
%        p, q are joined iff |Lm_p - Lm_q| <= seg.tau0 + seg.k_sig * sigma_px(d),
%        sigma_px(d) = depth.sigma_px + depth.sigma_px_slope * d the
%        per-pixel log-depth noise of the depth network at the pair's depth;
%     3b. flying pixels (just behind the edge of a nearer surface: a valid
%        neighbour with Lm_q < Lm_p - (seg.tau_fly + seg.k_fly sigma_px(d)))
%        are dropped;
%     4. components with fewer than cam.min_px pixels are discarded.
%     5. rim fragments (components of <= seg.frag_px pixels touching a nearer
%        component: the blurred rim of that object) are discarded.
%   lab   1 x (W*H) component label 1..n (0 = background / outlier / discarded)
%   n     number of components
H = cam.H; W = cam.W; P = H * W;
valid = reshape(isfinite(depth_hat) & depth_hat > 0, H, W);
L = nan(H, W);
L(valid) = log(depth_hat(valid(:).'));

% ---- k x k median over the valid neighbours (NaN-aware, vectorised);
%      k = seg.med_win (odd; larger for higher-resolution images)
kw = cfg.seg.med_win; hw = (kw - 1) / 2; nk = kw * kw;
Lp = nan(H + 2 * hw, W + 2 * hw);
Lp(hw + 1:H + hw, hw + 1:W + hw) = L;
S = zeros(nk, P);
k = 0;
for dr = 0:kw - 1
    for dc = 0:kw - 1
        k = k + 1;
        S(k, :) = reshape(Lp(1 + dr:H + dr, 1 + dc:W + dc), 1, P);
    end
end
S = sort(S, 1);                        % NaN are sorted last
c = sum(~isnan(S), 1);
im = max(floor((c + 1) / 2), 1);       % lower median: never an average of two
col = 0:nk:nk * (P - 1);               % surfaces (no bridge values at boundaries)
Lm = reshape(S(im + col), H, W);
ok = valid & reshape(c, H, W) >= 3 & abs(L - Lm) <= cfg.seg.tau_out;
Lm(~ok) = NaN;
% ---- edge pixels: the network blur turns a depth step between two objects
%      into a ramp of a few pixels whose single steps can be smaller than
%      the joining threshold; a pixel whose (central-difference) log-depth
%      gradient exceeds tau_e0 + k_e sigma_px(d) per pixel lies on such a
%      ramp or on the rim of an object and is not used
if cfg.seg.tau_e0 > 0
    Lq = nan(H + 2, W + 2);
    Lq(2:H + 1, 2:W + 1) = Lm;
    gx = abs(Lq(2:H + 1, 3:W + 2) - Lq(2:H + 1, 1:W)) / 2;
    gy = abs(Lq(3:H + 2, 2:W + 1) - Lq(1:H, 2:W + 1)) / 2;
    gx(isnan(gx)) = 0; gy(isnan(gy)) = 0;
    te = cfg.seg.tau_e0 + cfg.seg.k_e * (cfg.depth.sigma_px + cfg.depth.sigma_px_slope * exp(Lm));
    ok = ok & ~(max(gx, gy) > te);
    Lm(~ok) = NaN;
end
% ---- flying pixels: the network blurs depth edges, so pixels just behind
%      the edge of a nearer surface carry depths between the two surfaces
%      ("flying pixels"); a pixel with a clearly NEARER valid neighbour is
%      dropped (it would otherwise form phantom fragments behind objects)
if cfg.seg.tau_fly > 0
    Lq = nan(H + 2, W + 2);
    Lq(2:H + 1, 2:W + 1) = Lm;
    tf = cfg.seg.tau_fly + cfg.seg.k_fly * (cfg.depth.sigma_px + cfg.depth.sigma_px_slope * exp(Lm));
    fly = false(H, W);
    for dr = 0:2
        for dc = 0:2
            if dr == 1 && dc == 1, continue, end
            fly = fly | Lq(1 + dr:H + dr, 1 + dc:W + dc) < Lm - tf;   % false when NaN
        end
    end
    ok = ok & ~fly;
    Lm(~ok) = NaN;
end

% ---- edges between 8-neighbours with similar (filtered) depth
idx = reshape(1:P, H, W);
a = []; b = [];
dirs = [0 1; 1 0; 1 1; 1 -1];
for q = 1:size(dirs, 1)
    dr = dirs(q, 1); dc = dirs(q, 2);
    r1 = 1:H - dr; r2 = r1 + dr;
    if dc >= 0, c1 = 1:W - dc; else, c1 = 1 - dc:W; end
    c2 = c1 + dc;
    l1 = Lm(r1, c1); l2 = Lm(r2, c2);
    d = exp(0.5 * (l1 + l2));
    tau = cfg.seg.tau0 + cfg.seg.k_sig * (cfg.depth.sigma_px + cfg.depth.sigma_px_slope * d);
    e = abs(l1 - l2) <= tau;           % false when either side is NaN
    i1 = idx(r1, c1); i2 = idx(r2, c2);
    a = [a; i1(e)]; b = [b; i2(e)]; %#ok<AGROW>
end

% ---- connected components: hooking + pointer jumping (labels = root pixel)
lab = 1:P;
while true
    la = lab(a); lb = lab(b);
    ch = la ~= lb;
    if ~any(ch), break, end
    lo = min(la(ch), lb(ch)); hi = max(la(ch), lb(ch));
    lab(hi) = lo;                      % roots only: lo < hi, no cycles
    while true
        l2 = lab(lab);
        if isequal(l2, lab), break, end
        lab = l2;
    end
end

% ---- compact labels, drop small components
lab(~ok(:).') = 0;
roots = lab(lab > 0);
[u, ~, cid] = unique(roots);
cnt = accumarray(cid(:), 1);
big = cnt >= cfg.cam.min_px;
map = zeros(1, P);
map(u(big)) = 1:nnz(big);
out = zeros(1, P);
m = lab > 0;
out(m) = map(lab(m));
lab = out;
n = nnz(big);
% ---- rim fragments: a small component (<= seg.frag_px pixels) touching a
%      NEARER component is the blurred rim of that object, not an obstacle
if n > 0 && cfg.seg.frag_px > 0
    L2 = reshape(lab, H, W);
    Lm2 = Lm; Lm2(L2 == 0) = NaN;
    Lp = zeros(H + 2, W + 2); Lp(2:H + 1, 2:W + 1) = L2;
    Mp = nan(H + 2, W + 2); Mp(2:H + 1, 2:W + 1) = Lm2;
    touch = false(H, W);
    for dr = 0:2
        for dc = 0:2
            if dr == 1 && dc == 1, continue, end
            ln = Lp(1 + dr:H + dr, 1 + dc:W + dc);
            touch = touch | (ln > 0 & ln ~= L2 & Mp(1 + dr:H + dr, 1 + dc:W + dc) < Lm2);
        end
    end
    sz = accumarray(lab(lab > 0).', 1, [n, 1]);
    tc = accumarray(lab(lab > 0).', double(touch(lab > 0)).', [n, 1]) > 0;
    drop = tc & sz <= cfg.seg.frag_px;
    if any(drop)
        keep = find(~drop);
        map = zeros(1, n);
        map(keep) = 1:numel(keep);
        m = lab > 0;
        lab(m) = map(lab(m));
        n = numel(keep);
    end
end
end
