function ctrl = dart_controller_init(cfg, world, seed)
%DART_CONTROLLER_INIT State of the outer-loop DART controller.
ctrl.cfg = cfg;
ctrl.goal = world.goal;
if isfield(world, 'path'), W = world.path; else, W = [world.start, world.goal]; end
ctrl.G = dart_path_init(W);              % set path
ctrl.rj = struct('mode', 1, 's0', 0, 'e_lat', 0, 's_r', 0, 'n_rejoin', 0);
if strcmp(cfg.ref.mode, 'goal'), ctrl.rj.mode = 0; end
ctrl.target = world.goal;                % point the vehicle is heading for
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
