function test_perception_geometry()
% Ray-cast + segmentation of the depth image + sphere extraction recovers
% centre and radius (noise-free); the instance labels of the ray caster are
% used only to check the result.
cfg = dart_default_config();
cfg.depth.sigma_scale = 0; cfg.depth.sigma_px = 0;
cfg.depth.sigma_px_slope = 0; cfg.depth.p_outlier = 0;
cfg.depth.sigma_shift = 0; cfg.depth.sigma_corr = 0;
cam = dart_camera_rays(cfg);
p = [0; 0; 2]; R = eye(3);
C = [6 9; -1.0 1.5; 2.3 1.8]; rho = [0.6 0.8];
[depth, inst] = dart_render_depth(cam, p, R, cfg, C, rho);
rs = dart_rng_create(1);
depth_hat = dart_depth_network(depth, cfg, rs);
[lab, n] = dart_segment_depth(depth_hat, cam, cfg);
assert(n == 2, 'expected two segments');
for c = 1:2                                   % each segment is one sphere
    assert(numel(unique(inst(lab == c))) == 1, 'segment mixes two spheres');
end
det = dart_extract_obstacles(depth_hat, lab, cam, cfg);
assert(numel(det) == 2, 'expected two detections');
R_IC = R * cfg.cam.R_BC; o = p + R * cfg.cam.p_BC;
for k = 1:2
    c = o + R_IC * det(k).cC;
    [e, i] = min(sqrt(sum((C - c).^2, 1)));   % nearest true sphere
    assert(e < 0.2, 'centre error too large');
    assert(abs(det(k).rho - rho(i)) < 0.25 * rho(i), 'radius error too large');
end
% message round trip
msg = dart_msg_pack(1.0, 1.1, det, cfg);
[hdr, d2] = dart_msg_unpack(msg);
assert(hdr.valid && hdr.n == 2 && norm(d2(2).cC - det(2).cC) < 1e-12);
% two spheres whose images overlap but which are ~2.6 m apart in depth
% (8 m and 10.6 m): whatever the segmentation does at their blurred common
% edge, the extracted spheres (inflated by 2 sigma of their measurement
% covariance, as the safety layer does) must cover >= 90 % of the visible
% surface of EACH sphere in >= 30 of 40 frames
cfg = dart_default_config();
C = [8 10.6; 0 0.9; 2 2]; rho = [0.6 0.6];
[depth, inst] = dart_render_depth(cam, p, R, cfg, C, rho);
assert(numel(unique(inst(inst > 0))) == 2);
R_IC = R * cfg.cam.R_BC; o = p + R * cfg.cam.p_BC;
ncov = 0;
for s = 1:40
    dh = dart_depth_network(depth, cfg, rs);
    lab = dart_segment_depth(dh, cam, cfg);
    det = dart_extract_obstacles(dh, lab, cam, cfg);
    okj = false(1, 2);
    for j = 1:2
        k = find(inst == j);
        X = o + R_IC * (cam.dirC(:, k) .* (depth(k) ./ cam.cosz(k)));
        in = false(1, numel(k));
        for q = 1:numel(det)
            cq = o + R_IC * det(q).cC;
            in = in | sqrt(sum((X - cq).^2, 1)) <= det(q).rho + 2 * sqrt(max(eig(det(q).RC)));
        end
        okj(j) = mean(in) >= 0.9;
    end
    ncov = ncov + all(okj);
end
assert(ncov >= 30, 'adjacent spheres at different depths not covered');
% outside range -> no detection
[depth, inst] = dart_render_depth(cam, p, R, cfg, [60; 0; 2], 0.5);
assert(~any(inst > 0));
end
