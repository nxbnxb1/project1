function cam = dart_camera_rays(cfg)
%DART_CAMERA_RAYS Pre-computed pinhole camera geometry.
%   cam.K        intrinsic matrix (network output resolution W x H)
%   cam.dirC     3 x (W*H) unit ray directions in the optical frame
%   cam.cosz     1 x (W*H) z-component of the unit rays (depth = range*cosz)
%   cam.pix_ang  angular size of one pixel [rad]
%   cam.sub      the same camera sampled with cam.ss x cam.ss rays per
%                pixel (supersampling: the simulated scene is rendered on
%                these rays and averaged over each pixel's footprint, so
%                objects thinner than a pixel are mixed with their
%                background as in a real image)
cam = pinhole(cfg.cam.W, cfg.cam.H, cfg.cam.hfov);
ss = 1;
if isfield(cfg.cam, 'ss'), ss = cfg.cam.ss; end
cam.ss = ss;
cam.sub = pinhole(cfg.cam.W * ss, cfg.cam.H * ss, cfg.cam.hfov);
cam.sub.d_far = cfg.cam.R_max * cfg.depth.far_factor;   % render beyond R_max (the network may still see it)
end

function c = pinhole(W, H, hfov)
fpx = (W / 2) / tan(hfov / 2);
cx = (W + 1) / 2; cy = (H + 1) / 2;
[u, v] = meshgrid(1:W, 1:H);
rays = [(u(:).' - cx) / fpx; (v(:).' - cy) / fpx; ones(1, W * H)];   % K^{-1} [u v 1]'
n = sqrt(sum(rays.^2, 1));
c.K = [fpx 0 cx; 0 fpx cy; 0 0 1];
c.dirC = rays ./ n;
c.cosz = c.dirC(3, :);
c.pix_ang = 1 / fpx;
c.W = W; c.H = H;
c.vfov = 2 * atan((H / 2) / fpx);
c.hfov = hfov;
end
