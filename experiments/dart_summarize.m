function S = dart_summarize(T, outdir)
%DART_SUMMARIZE Aggregate runs per (scenario, variant); write CSV + Markdown.
S = struct([]);
if isempty(T), return, end
keys = {'success', 'collision', 'min_clear', 'clear_p05', 't_end', 't_goal', 'mean_speed', ...
        'n_infer', 'f_v_mean', 'f_v_peak', 'e_gpu', 'gpu_util', 'lat_mean', ...
        'N_mean', 'N_max', 'mpc_ms', 'mpc_cost', 'mpc_fail', 'cbf_frac', 'cbf_dev', ...
        'emerg_frac', 'est_err', 'est_err_p95'};
scen = unique_({T.scenario});
vars = unique_({T.variant});
for s = 1:numel(scen)
    for v = 1:numel(vars)
        idx = strcmp({T.scenario}, scen{s}) & strcmp({T.variant}, vars{v});
        if ~any(idx), continue, end
        row = struct('scenario', scen{s}, 'variant', vars{v}, 'n', sum(idx));
        for k = 1:numel(keys)
            x = [T(idx).(keys{k})];
            x = x(isfinite(x));
            if isempty(x), mu = NaN; sd = NaN; else, mu = mean(x); sd = std(x); end
            row.([keys{k} '_mean']) = mu;
            row.([keys{k} '_std']) = sd;
        end
        if isempty(S), S = row; else, S(end + 1) = row; end %#ok<AGROW>
    end
end

% ---------------------------------------------------------------- CSV
fid = fopen(fullfile(outdir, 'summary.csv'), 'w');
fn = fieldnames(S);
fprintf(fid, '%s', fn{1}); fprintf(fid, ',%s', fn{2:end}); fprintf(fid, '\n');
for i = 1:numel(S)
    for k = 1:numel(fn)
        x = S(i).(fn{k});
        if k > 1, fprintf(fid, ','); end
        if ischar(x), fprintf(fid, '%s', x); else, fprintf(fid, '%.6g', x); end
    end
    fprintf(fid, '\n');
end
fclose(fid);

% ----------------------------------------------------------- Markdown
fid = fopen(fullfile(outdir, 'summary.md'), 'w');
fprintf(fid, '# DART ablation summary\n\n');
if isfield(T, 'sweep_name')
    fprintf(fid, 'Sweep: %s = %g\n\n', T(1).sweep_name, T(1).sweep_value);
end
fprintf(fid, 'Mean (std) over seeds; rates with Wilson 95%% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.\n\n');
for s = 1:numel(scen)
    fprintf(fid, '## Scenario %s\n\n', scen{s});
    fprintf(fid, '| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |\n');
    fprintf(fid, '|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n');
    for i = 1:numel(S)
        if ~strcmp(S(i).scenario, scen{s}), continue, end
        r = S(i);
        fprintf(fid, '| %s | %d | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %.0f%% | %s |\n', ...
            r.variant, r.n, rate_ci(r.success_mean, r.n), rate_ci(r.collision_mean, r.n), ...
            ms(r, 'min_clear'), ms(r, 't_goal'), ms(r, 'mean_speed'), ms(r, 'n_infer', 0), ...
            ms(r, 'f_v_mean'), ms(r, 'e_gpu', 1), ms(r, 'N_mean', 1), ms(r, 'mpc_ms', 1), ...
            ms(r, 'mpc_cost'), 100 * r.cbf_frac_mean, ms(r, 'est_err'));
    end
    fprintf(fid, '\n');
end
fclose(fid);
end

function s = rate_ci(p, n)
% proportion with its Wilson 95 % score interval
k = round(p * n); z = 1.96;
c = (k + z^2 / 2) / (n + z^2);
h = z * sqrt(k * (n - k) / n + z^2 / 4) / (n + z^2);
s = sprintf('%.0f%% [%.0f, %.0f]', 100 * p, 100 * max(c - h, 0), 100 * min(c + h, 1));
end

function s = ms(r, k, dec)
if nargin < 3, dec = 2; end
fmt = sprintf('%%.%df (%%.%df)', dec, dec);
s = sprintf(fmt, r.([k '_mean']), r.([k '_std']));
end

function u = unique_(c)
u = {};
for i = 1:numel(c)
    if ~any(strcmp(u, c{i})), u{end + 1} = c{i}; end %#ok<AGROW>
end
end
