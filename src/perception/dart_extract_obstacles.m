function det = dart_extract_obstacles(depth_hat, inst, cam, cfg, upC)
%DART_EXTRACT_OBSTACLES Vertical covering cylinders from the segments of a depth image.
%   For every segment Omega_i of the label image inst (from
%   DART_SEGMENT_DEPTH; the ray-caster labels only in the oracle ablation),
%   with upC the upward vertical in the camera frame (from the attitude at
%   the capture time, i.e. the IMU's gravity direction; default: level
%   body):
%
%   1. Split (wide obstacles): a segment whose HORIZONTAL lateral
%      half-extent exceeds cam.r_chunk + r_chunk_slope * range is cut in two
%      along the principal horizontal axis of its 3-D points (at the
%      median), recursively, while each part keeps >= 2 min_px pixels. A
%      wall becomes a row of cylinders.
%   2. Cylinder of each part. Horizontal circle from the visible arc (exact
%      for a vertical cylinder), in the horizontal plane through the camera:
%        u_bar  = normalise(sum of horizontal ray bearings)
%        alpha  = max horizontal angle(u_p, u_bar) + half pixel
%        D_p    = r_p / (cos(phi_p) - sqrt(sin^2 alpha - sin^2 phi_p)),
%                 r_p the horizontal range of pixel p
%        D_hat  = median_p D_p,  axis at D_hat u_bar,  rho_cap = D_hat sin(alpha)
%      Cover: rho = max(rho_cap, cover_q-quantile of the horizontal distance
%      of the points from the axis - expected noise spread).
%      Vertical extent: lowest / highest point height (+- half a pixel).
%   3. Open ends: the bottom (top) is not seen if the part touches the lower
%      (upper) image border or if the pixel just below (above) it is nearer
%      (occluded by something in front). An open end makes the cylinder
%      extend to the ground (or upwards) in the tracker.
%
%   det is a struct array with fields id (segment label), npx, rho
%   (horizontal radius), cC (3x1: axis point at the middle height of the
%   visible part, camera frame), RC (3x3), trunc (touches the left / right
%   image border), hz (half-height of the visible part), open_lo, open_hi.
det = struct('id', {}, 'npx', {}, 'rho', {}, 'cC', {}, 'RC', {}, 'trunc', {}, ...
    'hz', {}, 'open_lo', {}, 'open_hi', {});
if nargin < 5 || isempty(upC)
    upC = cfg.cam.R_BC.' * [0; 0; 1];
end
upC = upC / norm(upC);
ids = unique(inst(inst > 0));
W = cam.W; H = cam.H;
for k = 1:numel(ids)
    id = ids(k);
    pix = find(inst == id & isfinite(depth_hat));
    if numel(pix) < cfg.cam.min_px
        continue
    end
    parts = split_segment(pix, depth_hat, cam, cfg, upC);
    for q = 1:numel(parts)
        d = part_cylinder(parts{q}, depth_hat, cam, cfg, numel(parts) > 1, upC);
        d.id = id;
        [vv, uu] = ind2sub([H, W], parts{q});
        d.trunc = any(uu == 1 | uu == W);
        [d.open_lo, d.open_hi] = open_ends(vv, uu, parts{q}, depth_hat, H);
        if d.trunc
            % region touching the left / right border -> partially visible
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
function parts = split_segment(pix, depth_hat, cam, cfg, upC)
X = points(pix, depth_hat, cam);
Ph = eye(3) - upC * upC.';
X = Ph * X;                                        % horizontal geometry only
ub = sum(Ph * cam.dirC(:, pix), 2); ub = ub / max(norm(ub), 1e-9);
lat = X - ub * (ub.' * X);
R_lat = max(sqrt(sum(lat.^2, 1)));
% far segments are split more coarsely: the shape detail matters only close
% to the vehicle (passing between obstacles); r_chunk grows with the range
r_ch = cfg.cam.r_chunk + cfg.cam.r_chunk_slope * median(sqrt(sum(X.^2, 1)));
if R_lat <= r_ch || numel(pix) < 2 * 2 * cfg.cam.min_px
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
parts = [split_segment(pix(side), depth_hat, cam, cfg, upC), ...
         split_segment(pix(~side), depth_hat, cam, cfg, upC)];
end

function X = points(pix, depth_hat, cam)
r = depth_hat(pix) ./ cam.cosz(pix);
X = cam.dirC(:, pix) .* r;
end

function d = part_cylinder(pix, depth_hat, cam, cfg, is_part, upC)
n = numel(pix);
U = cam.dirC(:, pix);
r = depth_hat(pix) ./ cam.cosz(pix);                % range along each ray
X = U .* r;
Ph = eye(3) - upC * upC.';
Uh = Ph * U;
nh = max(sqrt(sum(Uh.^2, 1)), 1e-9);
Uh = Uh ./ nh;                                      % horizontal bearings
rh = r .* nh;                                       % horizontal ranges
ub = sum(Uh, 2); ub = ub / max(norm(ub), 1e-9);
cphi = min(max(ub.' * Uh, -1), 1);
phi = acos(cphi);
alpha = min(max(phi) + 0.5 * cam.pix_ang, 1.4);
sa = sin(alpha);
core = phi <= 0.8 * alpha;
if ~any(core), core = true(size(phi)); end
den = cos(phi(core)) - sqrt(max(sa^2 - sin(phi(core)).^2, 0));
Dp = rh(core) ./ max(den, 1e-3);
D = median(Dp);
rho = D * sa;
ch = D * ub;                                        % axis, in the horizontal plane of the camera

% cover the measured surface (shapes other than vertical cylinders)
sig_px = cfg.depth.sigma_px + cfg.depth.sigma_px_slope * D;
dist = sort(sqrt(sum((Ph * X - ch).^2, 1)));
qn = dist(max(1, ceil(cfg.cam.cover_q * n)));
z_q = sqrt(2) * erfinv(2 * cfg.cam.cover_q - 1);   % quantile of N(0,1)
rho = max(rho, qn - z_q * sig_px * D);

% vertical extent of the visible part (heights relative to the camera)
h = upC.' * X;
mrg = 0.5 * cam.pix_ang * r;
h_lo = min(h - mrg); h_hi = max(h + mrg);
hz = (h_hi - h_lo) / 2;
cC = ch + upC * (h_lo + h_hi) / 2;

% measurement covariance in the camera frame (radial = horizontal bearing)
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
sV2 = sT2 + (0.5 * hz)^2;                           % middle height moves with what is visible
RC = sT2 * eye(3) + (sD2 - sT2) * (ub * ub.') + (sV2 - sT2) * (upC * upC.');
d = struct('id', 0, 'npx', n, 'rho', rho, 'cC', cC, 'RC', RC, 'trunc', false, ...
    'hz', hz, 'open_lo', false, 'open_hi', false);
end

function [open_lo, open_hi] = open_ends(vv, uu, pix, depth_hat, H)
%OPEN_ENDS Bottom / top of a part not seen: at the image border, or the
%   pixel just below / above it (same column) is nearer (occluder in front).
open_lo = false; open_hi = false;
for u = unique(uu(:)).'
    in = uu == u;
    [vb, ib] = max(vv(in)); [vt, it] = min(vv(in));
    pc = pix(in);
    if vb >= H
        open_lo = true;
    else
        nb = depth_hat((u - 1) * H + vb + 1);
        if isfinite(nb) && nb < depth_hat(pc(ib)) - 0.5, open_lo = true; end
    end
    if vt <= 1
        open_hi = true;
    else
        na = depth_hat((u - 1) * H + vt - 1);
        if isfinite(na) && na < depth_hat(pc(it)) - 0.5, open_hi = true; end
    end
    if open_lo && open_hi, return, end
end
end
