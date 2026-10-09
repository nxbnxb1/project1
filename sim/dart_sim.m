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
Nt = floor(cfg.sim.t_max / dtc + 1e-9);
nd = numel(dart_diag_names());

L = struct();
L.t = zeros(1, Nt);
L.x = zeros(17, Nt);
L.cmd = zeros(4, Nt);
L.dg = zeros(nd, Nt);
L.clear = zeros(1, Nt);
L.trig = zeros(1, Nt);
if cfg.sim.debug
    % [true idx; true clearance; tracked (a track within max(1, 2 rho) of it);
    %  est. centre error; sigma_pos;
    %  rho_hat - rho_true; in FOV; |v|; v . (c - p)/|c - p| (closing speed);
    %  track classified static]
    L.dbg = zeros(10, Nt);
end

outcome = 'timeout';
k_end = Nt;
wall = tic;
for k = 1:Nt
    t = (k - 1) * dtc;
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
        outcome = 'collision'; k_end = k; break
    end
    if norm(x(1:3) - world.goal) < cfg.sim.goal_tol
        outcome = 'goal'; k_end = k; break
    end
    if any(~isfinite(x))
        outcome = 'diverged'; k_end = k; break
    end
    for i = 1:nsub
        ts = t + (i - 1) * dtp;
        u = dart_attitude_controller(x, cmd, P);
        x = dart_rk4(x, u, ts, dtp, P);
    end
end
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
