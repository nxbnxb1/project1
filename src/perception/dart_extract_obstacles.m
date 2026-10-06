function det = dart_extract_obstacles(depth_hat, inst, cam, cfg)
%DART_EXTRACT_OBSTACLES Robust sphere measurements from a depth image (Eq. 10-11).
%   For every instance region Omega_i (segmentation is assumed available;
%   in simulation it comes from the ray caster) the function returns the
%   sphere centre in the CAMERA frame, its radius and a covariance:
%
%     u_bar  = normalise(sum of pixel rays)           mean bearing
%     alpha  = max angle(u_p, u_bar) + half pixel      angular radius
%     D_p    = r_p / (cos(phi_p) - sqrt(sin^2 alpha - sin^2 phi_p))
%     D_hat  = median_p D_p                            RobustAggregate
%     c_C    = D_hat * u_bar,  rho_hat = D_hat * sin(alpha)
%
%   det is a struct array with fields id, npx, rho, cC (3x1), RC (3x3), trunc.
det = struct('id', {}, 'npx', {}, 'rho', {}, 'cC', {}, 'RC', {}, 'trunc', {});
ids = unique(inst(inst > 0));
W = cam.W; H = cam.H;
for k = 1:numel(ids)
    id = ids(k);
    pix = find(inst == id & isfinite(depth_hat));
    n = numel(pix);
    if n < cfg.cam.min_px
        continue
    end
    U = cam.dirC(:, pix);
    r = depth_hat(pix) ./ cam.cosz(pix);           % range along each ray
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

    % region touching the image border -> partially visible sphere
    [vv, uu] = ind2sub([H, W], pix);
    trunc = any(uu == 1 | uu == W | vv == 1 | vv == H);

    % measurement covariance in the camera frame
    sig_px = cfg.depth.sigma_px + cfg.depth.sigma_px_slope * D;
    dD_dalpha = D * cos(alpha) / max(1 - sa, 1e-3);
    sD2 = (D * cfg.depth.sigma_scale)^2 + (D^2 * cfg.depth.sigma_shift)^2 ...
        + (D * sig_px)^2 * (pi/2) / n ...
        + (dD_dalpha * cam.pix_ang)^2 / 12;
    sT2 = D^2 * (cfg.depth.sigma_ang^2 + cam.pix_ang^2 / 12);
    if trunc
        sD2 = 4 * sD2 + (0.5 * rho)^2;
        sT2 = 4 * sT2 + (0.5 * rho)^2;
    end
    RC = sT2 * eye(3) + (sD2 - sT2) * (ub * ub.');

    det(end + 1) = struct('id', id, 'npx', n, 'rho', rho, 'cC', D * ub, ...
        'RC', RC, 'trunc', trunc); %#ok<AGROW>
end
end
