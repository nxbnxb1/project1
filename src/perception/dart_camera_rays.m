function cam = dart_camera_rays(cfg)
%DART_CAMERA_RAYS Pre-computed pinhole camera geometry.
%   cam.K        intrinsic matrix
%   cam.dirC     3 x (W*H) unit ray directions in the optical frame
%   cam.cosz     1 x (W*H) z-component of the unit rays (depth = range*cosz)
%   cam.pix_ang  angular size of one pixel [rad]
W = cfg.cam.W; H = cfg.cam.H;
fpx = (W / 2) / tan(cfg.cam.hfov / 2);
cx = (W + 1) / 2; cy = (H + 1) / 2;
[u, v] = meshgrid(1:W, 1:H);
rays = [(u(:).' - cx) / fpx; (v(:).' - cy) / fpx; ones(1, W * H)];   % K^{-1} [u v 1]'
n = sqrt(sum(rays.^2, 1));
cam.K = [fpx 0 cx; 0 fpx cy; 0 0 1];
cam.dirC = rays ./ n;
cam.cosz = cam.dirC(3, :);
cam.pix_ang = 1 / fpx;
cam.W = W; cam.H = H;
cam.vfov = 2 * atan((H / 2) / fpx);
cam.hfov = cfg.cam.hfov;
end
