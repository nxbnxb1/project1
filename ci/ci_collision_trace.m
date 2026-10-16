function ci_collision_trace(cases, outdir)
%CI_COLLISION_TRACE Re-run collision cases and log every change of the
%   obstacle memory (diagnosis only): for each controller step, the tracks
%   updated by a detection, created, forgotten (out of view and farther than
%   trk.forget_dist) or deleted after missed detections, with their cylinder
%   before and after, and the detections of each message (world frame).
%   cases  as CI_COLLISION_CASES ('E_COV:SN:6:13:3;...'); the simulation loop
%   is a copy of SIM/DART_SIM.M with the logging added (same results).
%   Writes trace_<sc>_<variant>_v<speed>_s<seed>.json (ev: [t slot kind
%   x y z rho zl zh active (before) x y z rho zl zh active (after)], kind 1
%   update / 2 new / 3 forgotten / 4 deleted after misses; det: [t t_c x y z
%   rho zl zh open_lo open_hi trunc npx]) and one TRACE line per case.
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root, 'dart_setup.m'));
warning('off', 'all');
if nargin < 2 || isempty(outdir), outdir = fullfile(root, 'results', 'debug'); end
if ~exist(outdir, 'dir'), mkdir(outdir); end
C = strsplit(cases, ';');
for i = 1:numel(C)
    f = strsplit(strtrim(C{i}), ':');
    if numel(f) < 4, continue, end
    va = f{1}; sc = f{2}; sp = str2double(f{3}); seed = str2double(f{4});
    rate = 3; if numel(f) >= 5, rate = str2double(f{5}); end
    ovr = @(c) dart_apply_sweep(c, 'speedrate', 100 * sp + 10 * rate);
    cfg = dart_default_config();
    cfg = dart_apply_variant(cfg, va);
    cfg = ovr(cfg);
    [world, cfg] = dart_scenario(sc, seed, cfg);
    cfg = ovr(cfg);
    cfg = dart_apply_tradeoff(cfg);
    dart_check_config(cfg);
    res = sim_traced(cfg, world);
    tr = res.trace;
    out = struct('variant', va, 'sc', sc, 'sp', sp, 'seed', seed, 'outcome', res.outcome, ...
        't_end', res.log.t(end), 'p_end', res.log.x(1:3, end).', 'ev', tr.ev, 'det', tr.det);
    fid = fopen(fullfile(outdir, sprintf('trace_%s_%s_v%g_s%d.json', sc, va, sp, seed)), 'w');
    fprintf(fid, '%s', jsonencode(out)); fclose(fid);
    fprintf('TRACE %s %s v%g s%d: %s t %.1f, %d events, %d detections\n', va, sc, sp, seed, res.outcome, ...
        res.log.t(end), size(tr.ev, 1), size(tr.det, 1));
end
end

function res = sim_traced(cfg, world)
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

snaps = struct('t', {}, 'p', {}, 'psi', {}, 'mode', {}, 'W', {}, 'q_r', {}, 'Pm', {}, 'c', {}, 'rho', {}, ...
    'zl', {}, 'zh', {}, 'infl', {}, 't_last', {});
t_snap = 0;
outcome = 'timeout';
k = 0;
wall = tic;
EV = zeros(0, 17); DT = zeros(0, 12);
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
    trk0 = ctrl.trk;
    [ctrl, cmd, trig, dg] = dart_controller_step(ctrl, t, x, msg);
    [EV, DT] = trace_step(EV, DT, trk0, ctrl, t, x, msg, cfg);
    if cfg.sim.snap_dt > 0 && t >= t_snap - 1e-9            % controller state for figures
        snaps(end + 1) = snapshot(ctrl, x, t, cfg); %#ok<AGROW>
        t_snap = t + cfg.sim.snap_dt;
    end
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
res.perc = struct('n_capt', perc.n_capt, 'e_gpu', perc.e_gpu, 't_busy', perc.t_busy, ...
    'seen_t', perc.seen_t);       % seen_t: evaluation only (last capture showing each object)
res.sched_why = ctrl.ss.n_why;   % triggers by reason (time dist sigma urgent emergency fixed)
res.fail_row = debug_row(ctrl, world, x, t, cfg);   % state at the end (failure analysis)
res.ref_mode_end = ctrl.rj.mode;
if cfg.sim.snap_dt > 0
    snaps(end + 1) = snapshot(ctrl, x, t, cfg);
end
res.snaps = snaps;
res.wall_time = toc(wall);
res.trace = struct('ev', EV, 'det', DT);
end

function s = snapshot(ctrl, x, t, cfg)
% controller state for figures: tracks in memory (vertical cylinders:
% radius, bottom / top with +-1e3 for an end never seen, and the margin
% radius rho + d_s + beta_s sigma the MPC keeps out of), detour plan, rejoin
% point, MPC prediction
ob = dart_tracks_now(ctrl.trk, t, cfg);
M = numel(ob.id);
sig = zeros(1, M);
for k = 1:M
    sig(k) = sqrt(max(eig((ob.P(1:3, 1:3, k) + ob.P(1:3, 1:3, k).') / 2)));
end
R = dart_quat2rotm(x(7:10));
q_r = nan(3, 1);
if ctrl.rj.mode == 2, q_r = dart_path_point(ctrl.G, ctrl.rj.s_r); end
Pm = zeros(3, 0);
if ~isempty(ctrl.sol), Pm = ctrl.sol.P; end
W = zeros(3, 0);
if isfield(ctrl.rj, 'W'), W = ctrl.rj.W; end
s = struct('t', t, 'p', x(1:3), 'psi', atan2(R(2, 1), R(1, 1)), 'mode', ctrl.rj.mode, 'W', W, ...
    'q_r', q_r, 'Pm', Pm, 'c', ob.c, 'rho', ob.rho, 'zl', max(ob.zl, -1e3), 'zh', min(ob.zh, 1e3), ...
    'infl', ob.rho + cfg.sched.d_s + cfg.mpc.beta_s * sig, 't_last', ctrl.ss.t_last);
end

function row = debug_row(ctrl, world, x, t, cfg)
% [true primitive idx; true clearance; tracked; centre error of the matched
%  track; its sigma_pos; rho_hat - rho_true (true spheres); in FOV; |v|;
%  closing speed; number of updates of the matched track]
% Evaluation only: tracks carry no identity, so the obstacle counts as
% "tracked" when some track's cylinder comes within 1 m of its true surface.
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
    zl = trk.zl(j); if trk.open_lo(j), zl = -inf; end
    zh = trk.zh(j); if trk.open_hi(j), zh = inf; end
    a = [xe(1:2); min(max(x(3), zl), zh)];              % track axis at the vehicle's height
    g = dart_world_sdf(wi, a, t) - trk.rho(j);          % gap track cylinder -> true surface
    if g < gbest, gbest = g; best = j; end
end
row(3) = best > 0 && gbest < 1.0;
if row(3)
    [xe, P] = dart_track_predict(trk, best, t, cfg);
    row(4) = norm(xe(1:3) - c);
    row(5) = sqrt(dart_lmax_sym3(P(1:3, 1:3)));
    if wi.type == 1, row(6) = trk.rho(best) - world.rho(i); end
    row(10) = trk.n_upd(best);
end
end

function [EV, DT] = trace_step(EV, DT, a, ctrl, t, x, msg, cfg)
% track changes made by one controller step (updates, new, deleted) and the detections of its message
b = ctrl.trk;
for i = find(a.active | b.active)
    s0 = [a.x(1:3, i).', a.rho(i), zlo(a, i), zhi(a, i), a.active(i)];
    s1 = [b.x(1:3, i).', b.rho(i), zlo(b, i), zhi(b, i), b.active(i)];
    if a.active(i) && b.active(i) && b.t_init(i) == a.t_init(i) && max(abs(s0(1:6) - s1(1:6))) < 1e-9
        continue
    end
    if b.active(i) && (~a.active(i) || b.t_init(i) ~= a.t_init(i))
        kind = 2;                                          % new track (or slot re-used)
    elseif ~b.active(i)
        p = x(1:3); R = dart_quat2rotm(x(7:10));
        c = a.x(1:3, i); d = max(norm(c - p), 1e-6);
        infov = dart_in_fov(c, p, R, cfg, -asin(min(a.rho(i) / d, 0.99)));
        zl = a.zl(i); if a.open_lo(i), zl = -inf; end
        zh = a.zh(i); if a.open_hi(i), zh = inf; end
        if ~infov && dart_cyl_dist(p, c, a.rho(i), zl, zh) > cfg.trk.forget_dist
            kind = 3;                                      % forgotten (out of view, far)
        else
            kind = 4;                                      % deleted after missed detections
        end
    else
        kind = 1;                                          % updated by a detection
    end
    EV(end + 1, :) = [t, i, kind, s0, s1]; %#ok<AGROW>
end
if msg(1) > 0.5
    [hdr, det] = dart_msg_unpack(msg);
    [pw, Rw] = dart_posebuf_lookup(ctrl.pb, hdr.t_c);
    for k = 1:numel(det)
        Y = pw + Rw * (cfg.cam.p_BC + cfg.cam.R_BC * det(k).cC);
        DT(end + 1, :) = [t, hdr.t_c, Y.', det(k).rho, Y(3) - det(k).hz, Y(3) + det(k).hz, ...
            det(k).open_lo, det(k).open_hi, det(k).trunc, det(k).npx]; %#ok<AGROW>
    end
end
end

function z = zlo(trk, i)
z = trk.zl(i); if trk.open_lo(i), z = -1e3; end
end

function z = zhi(trk, i)
z = trk.zh(i); if trk.open_hi(i), z = 1e3; end
end
