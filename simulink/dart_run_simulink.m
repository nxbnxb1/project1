function res = dart_run_simulink(cfg, world, mdl)
%DART_RUN_SIMULINK Run one closed-loop case with the Simulink model.
%   res has the same layout as the output of DART_SIM, so metrics and
%   plots are shared between the two engines.
if nargin < 3 || isempty(mdl), mdl = 'dart_closed_loop'; end
here = fileparts(mfilename('fullpath'));
if ~bdIsLoaded(mdl)
    f = fullfile(here, [mdl '.slx']);
    if exist(f, 'file')
        load_system(f);
    else
        dart_build_model(mdl, here);
    end
end
dart_registry('set', 'dart_cfg', cfg);
dart_registry('set', 'dart_world', world);

g = world.goal - world.start;
x0 = dart_quad_init_state(world.start, atan2(g(2), g(1)), cfg);
in = Simulink.SimulationInput(mdl);
in = in.setVariable('dart_x0', x0);
in = in.setVariable('dart_plant_P', dart_plant_vector(cfg));
in = in.setVariable('dart_dt_plant', cfg.sim.dt_plant);
in = in.setVariable('dart_dt_ctrl', cfg.sim.dt_ctrl);
in = in.setVariable('dart_t_max', cfg.sim.t_max - cfg.sim.dt_ctrl);

wall = tic;
out = sim(in);
wall = toc(wall);

t = get_log(out, 'log_t', []);
T = numel(t);
x = get_log(out, 'log_x', T);
cmd = get_log(out, 'log_cmd', T);
trig = get_log(out, 'log_trig', T);
dg = get_log(out, 'log_dg', T);
st = get_log(out, 'log_status', T);
clr = get_log(out, 'log_clear', T);

% same stopping semantics as dart_sim
outcome = 'timeout';
n = numel(t);
for k = 1:n
    if clr(k) < 0 && cfg.sim.stop_on_collision
        outcome = 'collision'; n = k; break
    end
    if norm(x(1:3, k) - world.goal) < cfg.sim.goal_tol
        outcome = 'goal'; n = k; break
    end
    if any(~isfinite(x(:, k)))
        outcome = 'diverged'; n = k; break
    end
end
L.t = t(1:n); L.x = x(:, 1:n); L.cmd = cmd(:, 1:n); L.dg = dg(:, 1:n);
L.clear = clr(1:n); L.trig = trig(1:n);

res.engine = 'simulink';
res.cfg = cfg;
res.world = world;
res.log = L;
res.outcome = outcome;
res.perc = struct('n_capt', st(2, end), 'e_gpu', st(3, end), 't_busy', st(4, end));
res.wall_time = wall;
end

function v = get_log(out, name, T)
%GET_LOG Logged signal as a (channels x time) array. 'Array' logging gives
%   T x n for 1-D signals and n x 1 x T for 2-D column signals.
v = out.get(name);
if isa(v, 'timeseries'), v = v.Data; end
v = squeeze(v);
if isvector(v)
    v = v(:).';
elseif ~isempty(T) && size(v, 1) == T && size(v, 2) ~= T
    v = v.';
end
end
