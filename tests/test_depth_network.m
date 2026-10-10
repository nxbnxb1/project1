function test_depth_network()
% Realistic camera model: a thin pole far away is diluted by the network
% blur (reads farther or disappears), a thin pole nearby and a large canopy
% far away are seen; flying pixels behind edges do not form phantom
% segments; haze removes far pixels.
cfg = dart_default_config();
cfg.depth.sigma_scale = 0; cfg.depth.sigma_px = 0; cfg.depth.sigma_px_slope = 0;
cfg.depth.p_outlier = 0; cfg.depth.sigma_shift = 0; cfg.depth.sigma_corr = 0;
cam = dart_camera_rays(cfg);
rs = dart_rng_create(3);
p = [0; 0; 2];
pole = @(x, r) struct('c0', [x; 0; 3], 'v', [0; 0; 0], 'rho', sqrt(r^2 + 9), 'type', 3, ...
    'dim', [r; 3; 0], 'yaw', 0, 'obj', 1);
% near pole (3 m): detected, depth close to the truth
[dh, inst] = dart_capture(cam, p, eye(3), cfg, pole(3.1, 0.1), 0, rs);
[lab, n] = dart_segment_depth(dh, cam, cfg);
assert(n >= 1 && any(lab(inst == 1) > 0), 'near pole not segmented');
dmed = median(dh(lab > 0));
assert(dmed > 2.7 && dmed < 3.6, 'near pole depth off');
% far thin pole (12 m): diluted - not seen or read clearly too far
[dh, inst] = dart_capture(cam, p, eye(3), cfg, pole(12.1, 0.06), 0, rs);
v = dh(inst == 1 & isfinite(dh));
assert(isempty(v) || median(v) > 13, 'far thin pole should be diluted');
% far canopy (sphere radius 2 m at 12 m): seen, depth within 10 %
w = struct('c0', [14; 0; 2], 'v', [0; 0; 0], 'rho', 2, 'type', 1, 'dim', [2; 0; 0], 'yaw', 0, 'obj', 1);
[dh, inst] = dart_capture(cam, p, eye(3), cfg, w, 0, rs);
[lab, n] = dart_segment_depth(dh, cam, cfg);
assert(n >= 1, 'canopy not segmented');
v = dh(lab > 0 & inst == 1);
assert(abs(median(v) - 12.2) < 1.2, 'canopy depth off');
% no phantom fragments: segments without object pixels are few
nphantom = 0;
for c = 1:n
    nphantom = nphantom + all(inst(lab == c) == 0);
end
assert(nphantom <= 1, 'flying pixels formed phantom segments');
% haze: with visibility 30 m most pixels of the canopy at 12 m are lost
cfg.depth.visibility = 30;
[dh, inst] = dart_capture(cam, p, eye(3), cfg, w, 0, rs);
assert(nnz(isfinite(dh(inst == 1))) < 0.6 * nnz(inst == 1), 'haze has no effect');
end
