function ci_collision_cases(cases, outdir)
%CI_COLLISION_CASES Re-run collision cases with fine controller snapshots and
%   write what the vehicle believed against the true world (diagnosis only).
%   cases  'E_COV:SN:6:13:3;FR_SAFE:SH:15:20:3' = variant:scenario:requested
%          speed:seed:maximum rate f_max [Hz] (sweep 'speedrate'), ';'-separated
%   For every case: case_<sc>_<variant>_v<speed>_s<seed>.json (DART_EXPORT_RUN,
%   snapshots every 0.1 s), diag_<...>.json and one COLL line in the log:
%     bel    distance from the vehicle to the nearest remembered cylinder minus
%            the body radius at the last snapshot [m] (what the controller saw)
%     belmin its minimum over the last 2 s
%     qtrk   distance from the true contact point to the nearest remembered
%            cylinder [m] (> 0: that part of the obstacle is not in memory)
%     unc    largest distance of the obstacle's surface within 2 m of the
%            vehicle (at its altitude) outside every remembered cylinder [m]
%     cbf    share of the last 1 s with the safety filter active, and its
%            largest slack; seen: time since a frame last showed the object
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
    try
        one_case(va, sc, sp, seed, rate, outdir);
    catch err
        fprintf('COLL %s %s v%g s%d failed: %s\n', va, sc, sp, seed, err.message);
    end
end
end

function one_case(va, sc, sp, seed, rate, outdir)
wall = tic;
res = dart_run_case(va, sc, seed, 'matlab', @(c) setup(c, sp, rate));
L = res.log; cfg = res.cfg; w = dart_world_defaults(res.world);
nm = dart_diag_names();
tag = sprintf('%s_%s_v%g_s%d', sc, va, sp, seed);
dart_export_run(res, fullfile(outdir, ['case_' tag '.json']));
S = res.snaps; tend = L.t(end); rb = cfg.quad.r_body;
% ---- believed vs true clearance at the snapshots of the last 6 s
rows = zeros(0, 7);
for k = 1:numel(S)
    if S(k).t < tend - 6, continue, end
    [b, bi] = nearest_cyl(S(k).p, S(k));
    [ct, it] = dart_world_clearance(res.world, S(k).p, S(k).t, rb);
    rows(end + 1, :) = [S(k).t, ct, b - rb, bi, it, S(k).mode, numel(S(k).rho)]; %#ok<AGROW>
end
out = struct('variant', va, 'sc', sc, 'sp', sp, 'seed', seed, 'rate', rate, 'outcome', res.outcome, ...
    't_end', tend, 'rows', rows, 'fail_row', res.fail_row.');
fr = res.fail_row; ip = fr(1);
qtrk = NaN; unc = NaN; seen = NaN;
p = L.x(1:3, end); Sl = S(end);
if ip > 0
    wi = prim(w, ip);
    [s0, g] = sdf_grad(wi, p, tend);
    q = p - s0 * g;                                   % closest point on the true surface
    [qtrk, jq] = nearest_cyl(q, Sl);
    out.prim = struct('i', ip, 'type', w.type(ip), 'dim', w.dim(:, ip).', 'c0', w.c0(:, ip).', ...
        'yaw', w.yaw(ip), 'obj', w.obj(ip));
    out.contact = struct('p', p.', 'q', q.', 'n_true', g.', 'q_to_track', qtrk, 'track', jq, ...
        'v', L.x(4:6, end).');
    if jq > 0
        out.track = struct('c', Sl.c(:, jq).', 'rho', Sl.rho(jq), 'zl', Sl.zl(jq), 'zh', Sl.zh(jq), ...
            'infl', Sl.infl(jq));
    end
    % uncovered depth: object surface near the vehicle (same object id), at its altitude
    ob_i = find(w.obj == w.obj(ip));
    unc = -inf;
    for a = linspace(0, 2 * pi, 73)
        for r = [0.5 1 1.5 2 2.5]
            x0 = p + r * [cos(a); sin(a); 0];
            for j = ob_i
                [sj, gj] = sdf_grad(prim(w, j), x0, tend);
                if abs(sj) > 0.6, continue, end
                y = x0 - sj * gj;                     % a surface point of the object
                if norm(y - p) > 2 + rb, continue, end
                unc = max(unc, nearest_cyl(y, Sl));
            end
        end
    end
    if isfield(res.perc, 'seen_t'), seen = tend - res.perc.seen_t(w.obj(ip)); end
end
kk = find(L.t >= tend - 3);
D = @(name) L.dg(strcmp(nm, name), kk);
out.steps = struct('t', L.t(kk), 'clear', L.clear(kk), 'speed', sqrt(sum(L.x(4:6, kk).^2, 1)), ...
    'cbf_active', D('cbf_active'), 'cbf_dev', D('cbf_dev'), 'cbf_slack', D('cbf_slack'), ...
    'h_min', D('h_min'), 'min_dc', D('min_dc'), 'emergency', D('emergency'), 'ref_mode', D('ref_mode'), ...
    'trig', L.trig(kk), 'n_tracks', D('n_tracks'), 'mpc_status', D('mpc_status'));
out.unc = unc; out.seen = seen;
fid = fopen(fullfile(outdir, ['diag_' tag '.json']), 'w');
fprintf(fid, '%s', jsonencode(out)); fclose(fid);
last1 = L.t(kk) >= tend - 1;
ca = D('cbf_active'); cs = D('cbf_slack');
bel = NaN; belmin = NaN;
if ~isempty(rows)
    bel = rows(end, 3);
    belmin = min(rows(rows(:, 1) >= tend - 2, 3));
end
fprintf(['COLL %s %s v%g s%d f%g %s t %.1f type %d bel %.2f belmin %.2f qtrk %.2f unc %.2f ' ...
    'cbf %.2f slack %.2f seen %.2f mode %d speed %.2f wall %.0f\n'], va, sc, sp, seed, rate, res.outcome, tend, ...
    w.type(max(ip, 1)), bel, belmin, qtrk, unc, mean(ca(last1)), max([cs(last1), 0]), seen, ...
    res.ref_mode_end, norm(L.x(4:6, end)), toc(wall));
end

function c = setup(c, sp, rate)
c = dart_apply_sweep(c, 'speedrate', 100 * sp + 10 * rate);
c.sim.snap_dt = 0.1;
c.sim.debug = true;
end

function wi = prim(w, j)
wi = struct();
for f = {'c0', 'v', 'rho', 'type', 'dim', 'yaw', 'obj'}
    wi.(f{1}) = w.(f{1})(:, j);
end
end

function [s0, g] = sdf_grad(wi, x, t)
e = 1e-5; g = zeros(3, 1);
for a = 1:3
    dp = zeros(3, 1); dp(a) = e;
    g(a) = (dart_world_sdf(wi, x + dp, t) - dart_world_sdf(wi, x - dp, t)) / (2 * e);
end
s0 = dart_world_sdf(wi, x, t);
g = g / max(norm(g), 1e-9);
end

function [d, j] = nearest_cyl(x, s)
% distance from x to the nearest remembered cylinder of snapshot s
d = inf; j = 0;
for k = 1:numel(s.rho)
    dk = dart_cyl_dist(x, s.c(:, k), s.rho(k), s.zl(k), s.zh(k));
    if dk < d, d = dk; j = k; end
end
end
