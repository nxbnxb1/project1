function Rv = dart_expected_meas_cov(D, rho, cfg)
%DART_EXPECTED_MEAS_COV Isotropic upper bound of the measurement covariance
%   expected for a sphere of radius rho at distance D (used by Eq. 79-80).
fpx = (cfg.cam.W / 2) / tan(cfg.cam.hfov / 2);
pix = 1 / fpx;
alpha = asin(min(rho / max(D, rho + 1e-3), 0.99));
npx = max(pi * (alpha / pix)^2, cfg.cam.min_px);
sig_px = cfg.depth.sigma_px + cfg.depth.sigma_px_slope * D;
s2 = (D * cfg.depth.sigma_scale)^2 + (D * sig_px)^2 * (pi/2) / npx ...
   + D^2 * (cfg.depth.sigma_ang^2 + pix^2 / 12) + cfg.est.sigma_p^2;
Rv = s2 * eye(3);
end
