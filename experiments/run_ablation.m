function T = run_ablation(varargin)
%RUN_ABLATION Monte-Carlo ablation study (Sec. 11).
%   T = RUN_ABLATION('scenarios', {'S1','S2','S3'}, 'seeds', 1:10, ...
%                    'variants', dart_variant_list(), 'engine', 'matlab', ...
%                    'outdir', 'results/ablation')
%   Optional: 'sweep', {name, value} applies DART_APPLY_SWEEP to every run.
%   Writes runs.csv, summary.csv, summary.md and figures to outdir and
%   prints summary.md to the console (readable from CI logs).
%   T is a struct array with one element per run.
op = parse_opts(varargin, struct('scenarios', {{'S1', 'S2', 'S3'}}, 'seeds', 1:10, ...
    'variants', {dart_variant_list()}, 'engine', 'matlab', ...
    'outdir', fullfile(dart_root(), 'results', 'ablation'), 'plots', true, 't_max', [], ...
    'sweep', {{}}));
if ~exist(op.outdir, 'dir'), mkdir(op.outdir); end
figdir = fullfile(op.outdir, 'figures');
if op.plots && ~exist(figdir, 'dir'), mkdir(figdir); end

runs_csv = fullfile(op.outdir, 'runs.csv');
T = struct([]);
nrun = numel(op.scenarios) * numel(op.variants) * numel(op.seeds);
irun = 0;
for s = 1:numel(op.scenarios)
    for v = 1:numel(op.variants)
        for seed = op.seeds(:).'
            irun = irun + 1;
            sc = op.scenarios{s}; va = op.variants{v};
            ovr = @(c) apply_opts(c, op);
            try
                res = dart_run_case(va, sc, seed, op.engine, ovr);
                m = dart_metrics(res);
                ok = true;
            catch err
                fprintf(2, 'run %s/%s/%d failed: %s\n', sc, va, seed, err.message);
                ok = false;
            end
            if ~ok, continue, end
            row = m;
            row.scenario = sc; row.variant = va; row.seed = seed;
            if ~isempty(op.sweep)
                row.sweep_name = op.sweep{1}; row.sweep_value = op.sweep{2};
            end
            if isempty(T), T = row; else, T(end + 1) = row; end %#ok<AGROW>
            write_csv(runs_csv, T);
            tag = '';
            if ~isempty(op.sweep), tag = sprintf('%s=%g ', op.sweep{1}, op.sweep{2}); end
            fprintf(['[%3d/%3d] %s%-3s %-11s seed %2d  %-9s clr %5.2f  t %5.1f  inf %3d  N %4.1f  mpc %5.1f ms  err %4.2f' ...
                '  xte %4.2f  xmax %4.2f  off %4.2f  nrj %d\n'], ...
                irun, nrun, tag, sc, va, seed, res.outcome, m.min_clear, m.t_end, m.n_infer, m.N_mean, m.mpc_ms, m.est_err, ...
                m.xte_rms, m.xte_max, m.off_frac, m.n_rejoin);
            if op.plots && seed == op.seeds(1)
                try
                    dart_plot_run(res, fullfile(figdir, sprintf('traj_%s_%s.png', sc, va)));
                catch perr
                    fprintf(2, 'plot skipped: %s\n', perr.message);
                end
            end
        end
    end
end
S = dart_summarize(T, op.outdir);
f = fullfile(op.outdir, 'summary.md');
if exist(f, 'file'), fprintf('\n%s\n', fileread(f)); end
if op.plots && ~isempty(S)
    try
        dart_plot_ablation(S, figdir);
    catch perr
        fprintf(2, 'plot skipped: %s\n', perr.message);
    end
end
end

function c = apply_opts(c, op)
if ~isempty(op.t_max), c.sim.t_max = op.t_max; end
if ~isempty(op.sweep), c = dart_apply_sweep(c, op.sweep{1}, op.sweep{2}); end
end

function op = parse_opts(args, op)
for i = 1:2:numel(args)
    op.(args{i}) = args{i + 1};
end
end

function write_csv(file, T)
fid = fopen(file, 'w');
fn = fieldnames(T);
lead = {'scenario'; 'variant'; 'seed'};
if isfield(T, 'sweep_name'), lead = [lead; {'sweep_name'; 'sweep_value'}]; end
fn = [lead; setdiff(fn, lead, 'stable')];
fprintf(fid, '%s\n', strjoin_(fn, ','));
for i = 1:numel(T)
    vals = cell(1, numel(fn));
    for k = 1:numel(fn)
        x = T(i).(fn{k});
        if ischar(x), vals{k} = x; else, vals{k} = sprintf('%.6g', x); end
    end
    fprintf(fid, '%s\n', strjoin_(vals, ','));
end
fclose(fid);
end

function s = strjoin_(c, d)
s = c{1};
for i = 2:numel(c), s = [s d c{i}]; end %#ok<AGROW>
end
