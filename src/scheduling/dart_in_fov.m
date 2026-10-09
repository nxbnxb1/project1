function vis = dart_in_fov(c, p, R_IB, cfg, margin)
%DART_IN_FOV True if the points c (3xM) are inside the camera frustum seen
%   from pose (p, R_IB) and closer than R_max. margin [rad] shrinks the FOV
%   (a negative margin enlarges it, up to 89 deg half-angle).
if nargin < 5, margin = 0; end
R_IC = R_IB * cfg.cam.R_BC;
o = p + R_IB * cfg.cam.p_BC;
cc = R_IC.' * (c - o);
th = tan(min(cfg.cam.hfov / 2 - margin, 89 * pi/180));
vfov = 2 * atan((cfg.cam.H / 2) / ((cfg.cam.W / 2) / tan(cfg.cam.hfov / 2)));
tv = tan(min(vfov / 2 - margin, 89 * pi/180));
z = cc(3, :);
vis = z > 0.2 & abs(cc(1, :)) <= th * z & abs(cc(2, :)) <= tv * z & z <= cfg.cam.R_max;
end
