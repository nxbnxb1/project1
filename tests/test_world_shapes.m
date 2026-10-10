function test_world_shapes()
% Boxes and cylinders: ray-cast hits lie on the true surface; the
% extracted covering spheres contain the visible surface of a wall (noise
% free) and a long wall is split into several spheres.
cfg = dart_default_config();
cfg.depth.sigma_scale = 0; cfg.depth.sigma_px = 0;
cfg.depth.sigma_px_slope = 0; cfg.depth.p_outlier = 0;
cam = dart_camera_rays(cfg);
W = struct('c0', [6 8; 0 1.5; 2 2], 'v', zeros(3, 2), 'rho', [norm([0.5 1 0.8]) norm([0.4 1.5])], ...
    'type', [2 3], 'dim', [0.5 0.4; 1 1.5; 0.8 0], 'yaw', [0.4 0], 'obj', [1 2]);
p = [0; 0; 2]; R = eye(3);
[d, ii] = dart_render_world(cam, p, R, cfg, W, 0);
k = find(isfinite(d));
o = p + cfg.cam.p_BC;
X = o + cfg.cam.R_BC * (cam.dirC(:, k) .* (d(k) ./ cam.cosz(k)));
S = dart_world_sdf(W, X, 0);
assert(nnz(ii == 1) > 50 && nnz(ii == 2) > 5, 'both primitives visible');
assert(max(min(abs(S), [], 1)) < 1e-9, 'hit points must lie on the surface');
[c, j] = dart_world_clearance(W, [6; 2.2; 2], 0, 0.25);
assert(j == 1 || j == 2);
assert(abs(c - (min(dart_world_sdf(W, [6; 2.2; 2], 0)) - 0.25)) < 1e-12);
% a 6 m wall seen at 5 m: split into several spheres that cover its face
% (split while the lateral half-extent exceeds r_chunk + r_chunk_slope * range)
Wl = struct('c0', [5; 0; 2], 'v', zeros(3, 1), 'rho', norm([0.15 3 1]), 'type', 2, ...
    'dim', [0.15; 3; 1], 'yaw', 0, 'obj', 1);
[d, ~] = dart_render_world(cam, p, R, cfg, Wl, 0);
lab = dart_segment_depth(d, cam, cfg);
det = dart_extract_obstacles(d, lab, cam, cfg);
assert(numel(det) >= 2, 'a long wall must be split into several spheres');   % r_chunk 2 m + 0.1 m/m
k = find(isfinite(d));
X = o + cfg.cam.R_BC * (cam.dirC(:, k) .* (d(k) ./ cam.cosz(k)));
inside = false(1, size(X, 2));
for q = 1:numel(det)
    cI = o + cfg.cam.R_BC * det(q).cC;
    inside = inside | sqrt(sum((X - cI).^2, 1)) <= det(q).rho + 0.05;
end
assert(mean(inside) >= 0.85, 'covering spheres must contain the visible surface');
end
