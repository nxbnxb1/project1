function test_cylinders()
% Vertical-cylinder obstacle model: distance and normal, locally equivalent
% spheres, vertical extent measured from the depth image (low container,
% high canopy), and the hard maximum perception rate / frames while stopped.

% ---- distance and outward normal (finite differences) at random points
rs = dart_rng_create(5);
c = [1; -2; 0]; rho = 1.5; zl = 0.5; zh = 3.0;
for k = 1:200
    p = [1; -2; 1.5] + 8 * (dart_rand(rs, 3, 1) - 0.5);
    [d, n] = dart_cyl_dist(p, c, rho, zl, zh);
    if d < 0.05, continue, end
    e = 1e-6; g = zeros(3, 1);
    for a = 1:3
        dp = zeros(3, 1); dp(a) = e;
        g(a) = (dart_cyl_dist(p + dp, c, rho, zl, zh) - dart_cyl_dist(p - dp, c, rho, zl, zh)) / (2 * e);
    end
    assert(norm(g - n) < 1e-4, 'normal is not the gradient of the distance');
    % locally equivalent sphere reproduces distance and gradient
    ob = struct('c', c, 'rho', rho, 'zl', zl, 'zh', zh);
    obl = dart_obstacles_local(ob, p);
    assert(abs(norm(p - obl.c) - rho - d) < 1e-9, 'local sphere distance');
    assert(norm((p - obl.c) / norm(p - obl.c) - n) < 1e-9, 'local sphere normal');
end
assert(abs(dart_cyl_dist([1; -2; 10], c, rho, -inf, inf) + rho) < 1e-12, 'infinite cylinder');

% ---- vertical extent from the depth image (noise-free network)
cfg = dart_default_config();
cfg.depth.sigma_scale = 0; cfg.depth.sigma_px = 0; cfg.depth.sigma_px_slope = 0;
cfg.depth.p_outlier = 0; cfg.depth.sigma_shift = 0; cfg.depth.sigma_corr = 0;
cam = dart_camera_rays(cfg);
p = [0; 0; 3]; R = eye(3);
R_IC = R * cfg.cam.R_BC; o = p + R * cfg.cam.p_BC;
upC = R_IC.' * [0; 0; 1];
% low container (top at 1.5 m) and a tree canopy (bottom at 3.2 m) 12 m ahead
w = struct('c0', [14 13; -2.5 3.5; 0.75 4.7], 'v', zeros(3, 2), 'type', [2 1], ...
    'dim', [2.5 1.5; 1.0 0; 0.75 0], 'yaw', [pi/2 0], 'obj', [1 2]);
w.rho = [norm(w.dim(:, 1)), 1.5];
[dh, ~] = dart_capture(cam, p, R, cfg, w, 0, dart_rng_create(1));
[lab, nseg] = dart_segment_depth(dh, cam, cfg);
assert(nseg >= 2, 'expected the container and the canopy');
det = dart_extract_obstacles(dh, lab, cam, cfg, upC);
top_box = NaN; bot_tree = NaN;
for k = 1:numel(det)
    cw = o + R_IC * det(k).cC;
    if norm(cw(1:2) - w.c0(1:2, 1)) < 3, top_box = cw(3) + det(k).hz; end
    if norm(cw(1:2) - w.c0(1:2, 2)) < 3 && ~det(k).open_lo, bot_tree = cw(3) - det(k).hz; end
end
assert(abs(top_box - 1.5) < 0.3, sprintf('container top %.2f m (true 1.5 m)', top_box));
assert(abs(bot_tree - 3.2) < 0.4, sprintf('canopy bottom %.2f m (true 3.2 m)', bot_tree));

% ---- hard maximum rate (every scheduler) and frames while stopped
for va = {'E_COV', 'E_DART', 'FR_SAFE'}
    c1 = dart_apply_variant(dart_default_config(), va{1});
    c1 = dart_apply_sweep(c1, 'speedrate', 1010);        % 10 m/s, at most 1 Hz
    [world, c1] = dart_scenario('S1', 1, c1);
    c1.sim.t_max = 6;
    res = dart_sim(c1, world);
    tt = res.log.t(res.log.trig > 0.5);
    assert(numel(tt) >= 2, 'perception never triggered');
    assert(min(diff(tt)) >= 1 - 1e-6, sprintf('%s: two frames closer than 1/f_max', va{1}));
end
c2 = dart_apply_variant(dart_default_config(), 'E_COV');
ss = dart_scheduler_init(c2);
ob = struct('id', zeros(1, 0), 'c', zeros(3, 0), 'v', zeros(3, 0), 'P', zeros(6, 6, 0), ...
    'rho', zeros(1, 0), 'q', zeros(1, 0));
rk = dart_risk_terms(ob, [0; 0; 2], [0; 0; 0], c2);
n = 0;
for k = 0:299                                            % 3 s standing still
    [ss, out] = dart_scheduler(ss, ob, rk, [0; 0; 2], [0; 0; 0], eye(3), 0.01 * k, c2, zeros(3, 0));
    n = n + out.trigger;
    ss.awaiting = false;                                 % results arrive at once
end
assert(n >= 3 * c2.sched.f_max - 1 && n <= 3 * c2.sched.f_max + 1, 'stopped: frames at f_max');
end
