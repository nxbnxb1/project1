function m = dart_metrics(res)
%DART_METRICS Evaluation metrics of one closed-loop run (Table 1, revised).
L = res.log;
cfg = res.cfg;
world = res.world;
nm = dart_diag_names();
D = @(name) L.dg(strcmp(nm, name), :);

t_end = L.t(end) + cfg.sim.dt_ctrl;
P = L.x(1:3, :);
seg = sqrt(sum(diff(P, 1, 2).^2, 1));
path_len = sum(seg);

m.success   = double(strcmp(res.outcome, 'goal'));
m.collision = double(strcmp(res.outcome, 'collision'));
m.t_end     = t_end;                      % end of the run (any outcome)
m.t_goal    = t_end;                      % time to the goal (successful runs only)
if ~m.success, m.t_goal = NaN; end
m.min_clear = min(L.clear);
m.clear_p05 = prctile_(L.clear, 5);
m.mean_speed = path_len / t_end;
if isfield(world, 'path'), Lset = sum(sqrt(sum(diff(world.path, 1, 2).^2, 1))); else, Lset = norm(world.goal - world.start); end
m.path_eff  = Lset / max(path_len, 1e-6) * m.success;   % set-path length / flown length

% ---- set path: cross-track error of the TRUE position (evaluation only)
if isfield(world, 'path'), W = world.path; else, W = [world.start, world.goal]; end
G = dart_path_init(W);
xte = zeros(1, size(P, 2));
sp = 0;
for k = 1:size(P, 2)
    [sp, xte(k)] = dart_path_project(G, P(:, k), sp - 2, sp + 10);
end
m.xte_mean = mean(xte);
m.xte_rms  = sqrt(mean(xte.^2));
m.xte_max  = max(xte);
m.off_frac = mean(xte > 0.5);            % fraction of time farther than 0.5 m from the path
nr = D('n_rejoin');
m.n_rejoin = nr(end);
m.rejoin_frac = mean(D('ref_mode') == 2);

% ---- perception load
trig_t = L.t(L.trig > 0.5);
m.n_infer   = res.perc.n_capt;
m.f_v_mean  = m.n_infer / t_end;
m.f_v_peak  = peak_rate(trig_t, 1.0);
m.e_gpu     = res.perc.e_gpu;
m.gpu_util  = res.perc.t_busy / t_end;
lat = D('latency'); lat = lat(lat > 0);
m.lat_mean  = mean_(lat);
m.lat_max   = max_(lat);

% ---- MPC
solved = D('mpc_solved') > 0.5;
Ns = D('N'); Ns = Ns(solved);
tm = D('mpc_time'); tm = tm(solved);
st = D('mpc_status'); st = st(solved);
m.N_mean     = mean_(Ns);
m.N_max      = max_(Ns);
m.mpc_ms     = 1000 * mean_(tm);
m.mpc_ms_max = 1000 * max_(tm);
m.mpc_fail   = mean_(double(st ~= 0 & st ~= 2));
m.mpc_cost   = mean_((3 * Ns).^3) / (3 * 20)^3;   % relative QP flops vs N = 20

% ---- safety layer
m.cbf_frac   = mean(D('cbf_active'));
m.cbf_dev    = mean(D('cbf_dev'));
m.emerg_frac = mean(D('emergency'));

% ---- estimation: error of the most critical track w.r.t. ground truth
%      (evaluation only: tracks carry no identity, so the estimate is
%      compared with the nearest true obstacle centre at that time)
ids = D('near_id');
C = [D('near_cx'); D('near_cy'); D('near_cz')];
k = find(ids > 0);
err = zeros(1, numel(k));
for i = 1:numel(k)
    j = k(i);
    ct = world.c0 + world.v * L.t(j);
    err(i) = min(sqrt(sum((ct - C(:, j)).^2, 1)));
end
% meaningful for sphere worlds (S1-S3); for boxes / walls / poles covered
% by several spheres the nearest primitive centre is not the estimated point
m.est_err = mean_(err);
m.est_err_p95 = prctile_(err, 95);
end

function r = peak_rate(t, win)
r = 0;
for i = 1:numel(t)
    r = max(r, sum(t >= t(i) & t < t(i) + win) / win);
end
end

function v = mean_(x)
if isempty(x), v = NaN; else, v = mean(x); end
end

function v = max_(x)
if isempty(x), v = NaN; else, v = max(x); end
end

function v = prctile_(x, p)
% percentile without the Statistics Toolbox
if isempty(x), v = NaN; return, end
x = sort(x(:));
i = max(1, min(numel(x), round(p / 100 * numel(x))));
v = x(i);
end
