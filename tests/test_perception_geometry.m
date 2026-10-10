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
% two spheres whose images overlap but which are ~2 m apart in depth
% (8 m and 10 m) are rarely merged under the default depth noise (a merge
% = one segment with >= 3 pixels of each sphere). The network blurs depth
% edges (range-dependent blur), so the bound is looser than for a sharp
% depth image: <= 8 merges and >= 28/40 frames with both found.
cfg = dart_default_config();
C = [8 10.6; 0 0.9; 2 2]; rho = [0.6 0.6];
[depth, inst] = dart_render_depth(cam, p, R, cfg, C, rho);
assert(numel(unique(inst(inst > 0))) == 2);
nmerge = 0; nfound = 0;
for s = 1:40
    [lab, n] = dart_segment_depth(dart_depth_network(depth, cfg, rs), cam, cfg);
    for c = 1:n
        m = inst(lab == c);
        nmerge = nmerge + (min(nnz(m == 1), nnz(m == 2)) >= 3);
    end
    nfound = nfound + (n >= 2);
end
assert(nmerge <= 8 && nfound >= 28, 'adjacent spheres at different depths merged too often');
% outside range -> no detection
[depth, inst] = dart_render_depth(cam, p, R, cfg, [40; 0; 2], 0.5);
assert(~any(inst > 0));
end
