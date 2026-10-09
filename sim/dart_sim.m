function res = dart_sim(cfg, world)
%DART_SIM Closed-loop simulation with the pure-MATLAB engine.
%   res = DART_SIM(cfg, world) runs the same blocks as the Simulink model
%   (see simulink/dart_build_model.m) with the same multi-rate structure:
%
%     plant (6-DOF, RK4) + attitude loop ........ cfg.sim.dt_plant
%     perception output -> controller -> perception update ... cfg.sim.dt_ctrl
%     MPC re-solve ................................ cfg.mpc.period (inside controller)
%
%   It is used for unit tests, Monte-Carlo ablations and as a reference
%   for the Simulink model. Works in MATLAB and GNU Octave.
seed = cfg.sim.seed;
P = dart_plant_vector(cfg);
g = world.goal - world.start;
x = dart_quad_init_state(world.start, atan2(g(2), g(1)), cfg);
perc = dart_perception_init(cfg, world, seed);
ctrl = dart_controller_init(cfg, world, seed);

dtc = cfg.sim.dt_ctrl;
dtp = cfg.sim.dt_plant;
nsub = round(dtc / dtp);
nd = numel(dart_diag_names());
% no time limit on the mission: the time to the goal is a RESULT. A run
% ends at the goal, at a collision, or when the vehicle is stuck (no
% progress of sim.stuck_dist along the set path for sim.stuck_window s:
% it would never arrive). sim.t_max (default inf) is only used by short
% tests; sim.t_cap is a compute guard that should never be reached.
t_end = min(cfg.sim.t_max, cfg.sim.t_cap);
if isfield(world, 'path'), Gp = dart_path_init(world.path); else, Gp = dart_path_init([world.start, world.goal]); end
s_true = 0; s_best = 0; t_best = 0;
chunk = 2000;
L = struct();
L.t = zeros(1, chunk);
L.x = zeros(17, chunk);
L.cmd = zeros(4, chunk);
L.dg = zeros(nd, chunk);
L.clear = zeros(1, chunk);
L.trig = zeros(1, chunk);
if cfg.sim.debug
    % see debug_row
    L.dbg = zeros(10, chunk);
end

outcome = 'timeout';
k = 0;
wall = tic;
while true
    k = k + 1;
    t = (k - 1) * dtc;
    if t > t_end + 1e-9
        k = k - 1;
        if t_end >= cfg.sim.t_cap, outcome = 'cap'; end
        break
    end
    if k > numel(L.t)                                % grow the log
        fn = fieldnames(L);
        for i = 1:numel(fn), L.(fn{i}) = [L.(fn{i}), zeros(size(L.(fn{i}), 1), chunk)]; end
    end
    [perc, msg] = dart_perception_output(perc, t);
    [ctrl, cmd, trig, dg] = dart_controller_step(ctrl, t, x, msg);
    perc = dart_perception_update(perc, t, x, trig);

    clr = dart_world_clearance(world, x(1:3), t, cfg.quad.r_body);
    L.t(k) = t; L.x(:, k) = x; L.cmd(:, k) = cmd; L.dg(:, k) = dg;
    L.clear(k) = clr; L.trig(k) = trig;
    if cfg.sim.debug
        L.dbg(:, k) = debug_row(ctrl, world, x, t, cfg);
    end

    if clr < 0 && cfg.sim.stop_on_collision
        outcome = 'collision'; break
    end
    if norm(x(1:3) - world.goal) < cfg.sim.goal_tol
        outcome = 'goal'; break
    end
    if any(~isfinite(x))
        outcome = 'diverged'; break
    end
    if mod(k, 10) == 1                               % progress along the set path (true position)
        s_true = dart_path_project(Gp, x(1:3), s_true - 2, s_true + 10);
        if s_true > s_best + cfg.sim.stuck_dist
            s_best = s_true; t_best = t;
        elseif t - t_best > cfg.sim.stuck_window
            outcome = 'stuck'; break
        end
    end
    for i = 1:nsub
        ts = t + (i - 1) * dtp;
        u = dart_attitude_controller(x, cmd, P);
        x = dart_rk4(x, u, ts, dtp, P);
    end
end
k_end = k;
fn = fieldnames(L);
for i = 1:numel(fn)
    L.(fn{i}) = L.(fn{i})(:, 1:k_end);
end

res.engine = 'matlab';
res.cfg = cfg;
res.world = world;
res.log = L;
res.outcome = outcome;
res.perc = struct('n_capt', perc.n_capt, 'e_gpu', perc.e_gpu, 't_busy', perc.t_busy);
res.sched_why = ctrl.ss.n_why;   % triggers by reason (time dist sigma urgent emergency fixed)
res.fail_row = debug_row(ctrl, world, x, t, cfg);   % state at the end (failure analysis)
res.ref_mode_end = ctrl.rj.mode;
res.wall_time = toc(wall);
end

function row = debug_row(ctrl, world, x, t, cfg)
% [true primitive idx; true clearance; tracked; centre error of the matched
%  track; its sigma_pos; rho_hat - rho_true (spheres); in FOV; |v|;
%  closing speed; matched track classified static]
% Evaluation only: tracks carry no identity, so the obstacle counts as
% "tracked" when some track's sphere comes within 1 m of its true surface.
[clr, i] = dart_world_clearance(world, x(1:3), t, cfg.quad.r_body);
row = nan(10, 1);
row(2) = clr; row(8) = norm(x(4:6));
if i == 0, row(1) = 0; return, end
row(1) = i;
c = world.c0(:, i) + world.v(:, i) * t;
u = (c - x(1:3)) / max(norm(c - x(1:3)), 1e-9);
row(9) = (x(4:6) - world.v(:, i)).' * u;
row(7) = dart_in_fov(c, x(1:3), dart_quat2rotm(x(7:10)), cfg);
trk = ctrl.trk;
wa = dart_world_defaults(world);
wi = struct();                         % the primitive alone
for f = {'c0', 'v', 'rho', 'type', 'dim', 'yaw', 'obj'}
    wi.(f{1}) = wa.(f{1})(:, i);
end
best = 0; gbest = inf;
for j = find(trk.active)
    xe = dart_track_predict(trk, j, t, cfg);
    g = dart_world_sdf(wi, xe(1:3), t) - trk.rho(j);   % gap track sphere -> true surface
    if g < gbest, gbest = g; best = j; end
end
row(3) = best > 0 && gbest < 1.0;
if row(3)
    [xe, P] = dart_track_predict(trk, best, t, cfg);
    row(4) = norm(xe(1:3) - c);
    row(5) = sqrt(dart_lmax_sym3(P(1:3, 1:3)));
    if wi.type == 1, row(6) = trk.rho(best) - world.rho(i); end
    row(10) = trk.static(best);
end
end
