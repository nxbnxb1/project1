% DART_EXPORT_SCENE  Export the obstacle layouts of S1/S2 (seed 1) and one synthetic
% depth frame (true depth, simulated network output, instance labels, extracted
% spheres) to results/scene/*.csv. Run from the repository root; figures:
%   python3 docs/figures/plot_scene.py results/scene docs/figures
dart_setup;
out = fullfile(dart_root(), 'results', 'scene');
if ~exist(out, 'dir'), mkdir(out); end
for s = {'S1', 'S2'}
    cfg = dart_default_config(); cfg = dart_apply_variant(cfg, 'E_DART');
    [w, cfg] = dart_scenario(s{1}, 1, cfg);
    M = [w.c0; w.v; w.rho].';
    dlmwrite(fullfile(out, sprintf('world_%s.csv', s{1})), M, 'precision', 6);
end
% one synthetic depth frame in S1 from the start, looking at the first cluster
cfg = dart_default_config(); cfg = dart_apply_variant(cfg, 'E_DART');
[w, cfg] = dart_scenario('S1', 1, cfg);
perc = dart_perception_init(cfg, w, 1);
p = [4; 0; 2]; R_IB = eye(3);
[depth, inst] = dart_render_depth(perc.cam, p, R_IB, cfg, w.c0, w.rho);
rs = dart_rng_create(7);
depth_hat = dart_depth_network(depth, cfg, rs);
det = dart_extract_obstacles(depth_hat, inst, perc.cam, cfg);
dlmwrite(fullfile(out, 'depth_true.csv'), reshape(depth, cfg.cam.H, cfg.cam.W), 'precision', 6);
dlmwrite(fullfile(out, 'depth_hat.csv'), reshape(depth_hat, cfg.cam.H, cfg.cam.W), 'precision', 6);
dlmwrite(fullfile(out, 'inst.csv'), reshape(inst, cfg.cam.H, cfg.cam.W));
D = zeros(numel(det), 6);
for k = 1:numel(det)
    cI = p + R_IB * (cfg.cam.p_BC + cfg.cam.R_BC * det(k).cC);
    D(k, :) = [det(k).id, cI.', det(k).rho, det(k).npx];
end
dlmwrite(fullfile(out, 'detections.csv'), D, 'precision', 6);
printf('ok %d detections\n', numel(det));
