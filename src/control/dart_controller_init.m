function ctrl = dart_controller_init(cfg, world, seed)
%DART_CONTROLLER_INIT State of the outer-loop DART controller.
ctrl.cfg = cfg;
ctrl.goal = world.goal;
ctrl.rs = dart_rng_create(3000 + seed);
ctrl.trk = dart_tracks_init(cfg);
ctrl.pb = dart_posebuf_init(cfg.est.buffer_len);
ctrl.ss = dart_scheduler_init(cfg);
ctrl.sol = [];
ctrl.t_next_mpc = -inf;
ctrl.u_prev = zeros(3, 1);
g = world.goal - world.start;
ctrl.psi = atan2(g(2), g(1));
ctrl.last_N = cfg.mpc.N_min;
ctrl.hz = struct('ttc', inf, 'rho', 0, 'N_risk', 0, 'N_brake', 0, 'N_meas', 0, 'T_new', 0);
end
