function test_perception_geometry()
% Ray-cast + sphere extraction recovers centre and radius (noise-free).
cfg = dart_default_config();
cfg.depth.sigma_scale = 0; cfg.depth.sigma_px = 0;
cfg.depth.sigma_px_slope = 0; cfg.depth.p_outlier = 0;
cam = dart_camera_rays(cfg);
p = [0; 0; 2]; R = eye(3);
C = [6 9; -1.0 1.5; 2.3 1.8]; rho = [0.6 0.8];
[depth, inst] = dart_render_depth(cam, p, R, cfg, C, rho);
rs = dart_rng_create(1);
det = dart_extract_obstacles(dart_depth_network(depth, cfg, rs), inst, cam, cfg);
assert(numel(det) == 2, 'expected two detections');
R_IC = R * cfg.cam.R_BC; o = p + R * cfg.cam.p_BC;
for k = 1:2
    i = det(k).id;
    c = o + R_IC * det(k).cC;
    assert(norm(c - C(:, i)) < 0.2, 'centre error too large');
    assert(abs(det(k).rho - rho(i)) < 0.25 * rho(i), 'radius error too large');
end
% message round trip
msg = dart_msg_pack(1.0, 1.1, det, cfg);
[hdr, d2] = dart_msg_unpack(msg);
assert(hdr.valid && hdr.n == 2 && norm(d2(2).cC - det(2).cC) < 1e-12);
% outside range -> no detection
[depth, inst] = dart_render_depth(cam, p, R, cfg, [40; 0; 2], 0.5);
assert(~any(inst > 0));
end
