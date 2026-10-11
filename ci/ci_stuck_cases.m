function ci_stuck_cases(cases, variants, outdir)
%CI_STUCK_CASES Re-run selected cases with controller snapshots and export
%   them as JSON for figures (docs/figures/plot_stuck.py).
%   cases     'SN:10:12;SH:6:5' = scenario:requested speed:seed, ';'-separated
%   variants  comma-separated, default 'E_COV,FR_SAFE_3' (the same world flown
%             by each variant, for comparison)
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root, 'dart_setup.m'));
warning('off', 'all');
if nargin < 2 || isempty(variants), variants = 'E_COV,FR_SAFE_3'; end
if nargin < 3 || isempty(outdir), outdir = fullfile(root, 'results', 'debug'); end
if ~exist(outdir, 'dir'), mkdir(outdir); end
C = strsplit(cases, ';');
V = strsplit(variants, ',');
for i = 1:numel(C)
    f = strsplit(strtrim(C{i}), ':');
    if numel(f) < 3, continue, end
    sc = f{1}; sp = str2double(f{2}); seed = str2double(f{3});
    for j = 1:numel(V)
        va = strtrim(V{j});
        res = dart_run_case(va, sc, seed, 'matlab', @(c) setup(c, sp));
        file = fullfile(outdir, sprintf('case_%s_v%g_s%d_%s.json', sc, sp, seed, va));
        dart_export_run(res, file);
        fprintf('%s %s v=%g seed %d: %s t=%.1f inf=%d -> %s\n', va, sc, sp, seed, res.outcome, ...
            res.log.t(end), sum(res.log.trig), file);
    end
end
end

function c = setup(c, sp)
c = dart_apply_sweep(c, 'speed', sp);
c.sim.snap_dt = 0.5;
end
