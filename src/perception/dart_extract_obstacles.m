function det = dart_extract_obstacles(depth_hat, inst, cam, cfg)
%DART_EXTRACT_OBSTACLES Covering spheres from the segments of a depth image (Eq. 10-11).
%   For every segment Omega_i of the label image inst (from
%   DART_SEGMENT_DEPTH; the ray-caster labels only in the oracle ablation):
%
%   1. Split (obstacles of any shape): a segment whose lateral half-extent
%      R_lat = max_p |X_p - (u_bar' X_p) u_bar| exceeds cam.r_chunk is cut
%      in two along the principal axis of its 3-D points X_p (at the
%      median), recursively, while each part keeps >= 2 min_px pixels.
%      A wall becomes a row of spheres instead of one huge sphere.
%   2. Sphere of each part (exact for the visible cap of a sphere):
%        u_bar  = normalise(sum of pixel rays)           mean bearing
%        alpha  = max angle(u_p, u_bar) + half pixel      angular radius
%        D_p    = r_p / (cos(phi_p) - sqrt(sin^2 alpha - sin^2 phi_p))
%        D_hat  = median_p D_p                            RobustAggregate
%        c_C    = D_hat * u_bar,  rho_cap = D_hat * sin(alpha)
%   3. Cover: the sphere must contain the measured surface. For a sphere
%      rho_cap already does; for a flat face it does not (the edges of the
%      face stick out in front of the sphere by up to ~ sqrt(2) rho_cap).
%      rho = max(rho_cap, q-quantile_p |X_p - c_C| - noise), q = cam.cover_q,
%      with X_p from the per-pixel ranges; the expected spread of the
%      depth noise (cover_q-quantile of a centred normal) is subtracted so
%      that a sphere is not inflated by noise.
%
%   det is a struct array with fields id (segment label), npx, rho, cC (3x1),
%   RC (3x3), trunc.
det = struct('id', {}, 'npx', {}, 'rho', {}, 'cC', {}, 'RC', {}, 'trunc', {});
ids = unique(inst(inst > 0));
W = cam.W; H = cam.H;
for k = 1:numel(ids)
    id = ids(k);
    pix = find(inst == id & isfinite(depth_hat));
    if numel(pix) < cfg.cam.min_px
        continue
    end
    parts = split_segment(pix, depth_hat, cam, cfg);
    for q = 1:numel(parts)
        d = part_sphere(parts{q}, depth_hat, cam, cfg, numel(parts) > 1);
        d.id = id;
        [vv, uu] = ind2sub([H, W], parts{q});
        d.trunc = any(uu == 1 | uu == W | vv == 1 | vv == H);
        if d.trunc
            % region touching the image border -> partially visible
            ub = d.cC / norm(d.cC);
            sD2 = ub.' * d.RC * ub;
            sT2 = (trace(d.RC) - sD2) / 2;
            sD2 = 4 * sD2 + (0.5 * d.rho)^2;
            sT2 = 4 * sT2 + (0.5 * d.rho)^2;
            d.RC = sT2 * eye(3) + (sD2 - sT2) * (ub * ub.');
        end
        det(end + 1) = d; %#ok<AGROW>
    end
end
end

% =====================================================================
function parts = split_segment(pix, depth_hat, cam, cfg)
X = points(pix, depth_hat, cam);
ub = sum(cam.dirC(:, pix), 2); ub = ub / norm(ub);
lat = X - ub * (ub.' * X);
R_lat = max(sqrt(sum(lat.^2, 1)));
if R_lat <= cfg.cam.r_chunk || numel(pix) < 2 * 2 * cfg.cam.min_px
    parts = {pix};
    return
end
Xc = X - mean(X, 2);
[V, E] = eig(Xc * Xc.');
[~, j] = max(diag(E));
proj = V(:, j).' * Xc;
side = proj > median(proj);
if all(side) || ~any(side)
    parts = {pix};
    return
end
parts = [split_segment(pix(side), depth_hat, cam, cfg), ...
         split_segment(pix(~side), depth_hat, cam, cfg)];
end

function X = points(pix, depth_hat, cam)
r = depth_hat(pix) ./ cam.cosz(pix);
X = cam.dirC(:, pix) .* r;
end

function d = part_sphere(pix, depth_hat, cam, cfg, is_part)
n = numel(pix);
U = cam.dirC(:, pix);
r = depth_hat(pix) ./ cam.cosz(pix);                % range along each ray
ub = sum(U, 2); ub = ub / norm(ub);
cphi = min(max(ub.' * U, -1), 1);
phi = acos(cphi);
alpha = max(phi) + 0.5 * cam.pix_ang;
sa = sin(alpha);
core = phi <= 0.8 * alpha;
if ~any(core), core = true(size(phi)); end
den = cos(phi(core)) - sqrt(max(sa^2 - sin(phi(core)).^2, 0));
Dp = r(core) ./ max(den, 1e-3);
D = median(Dp);
rho = D * sa;
cC = D * ub;

% cover the measured surface (shapes other than spheres)
sig_px = cfg.depth.sigma_px + cfg.depth.sigma_px_slope * D;
dist = sqrt(sum((U .* r - cC).^2, 1));
dist = sort(dist);
qn = dist(max(1, ceil(cfg.cam.cover_q * n)));
z_q = sqrt(2) * erfinv(2 * cfg.cam.cover_q - 1);   % quantile of N(0,1)
rho = max(rho, qn - z_q * sig_px * D);

% measurement covariance in the camera frame
dD_dalpha = D * cos(alpha) / max(1 - sa, 1e-3);
sD2 = (D * cfg.depth.sigma_scale)^2 + (D * cfg.depth.sigma_corr)^2 + (D * cfg.depth.sigma_bias)^2 ...
    + (D^2 * cfg.depth.sigma_shift)^2 ...
    + (D * sig_px)^2 * (pi/2) / n ...
    + (dD_dalpha * cam.pix_ang)^2 / 12;
sT2 = D^2 * (cfg.depth.sigma_ang^2 + cam.pix_ang^2 / 12);
if is_part
    % the cut of a split segment moves with the visible extent
    sT2 = sT2 + (0.5 * rho)^2;
    sD2 = sD2 + (0.5 * rho)^2;
end
RC = sT2 * eye(3) + (sD2 - sT2) * (ub * ub.');
d = struct('id', 0, 'npx', n, 'rho', rho, 'cC', cC, 'RC', RC, 'trunc', false);
end
