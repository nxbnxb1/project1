function ci_sweep(scenario, param, value, seeds, variants, engine, outdir)
%CI_SWEEP Entry point of the sensitivity-sweep workflow (one matrix job).
%   ci_sweep('S2', 'latency', 0.15, '1:20', 'E_DART,G_FR_LOW,FR_SAFE_10', 'matlab', outdir)
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root, 'dart_setup.m'));
warning('off', 'all');
if ischar(value), value = str2double(value); end
if ischar(seeds), seeds = eval(seeds); end
variants = strsplit_(variants);
if nargin < 7 || isempty(outdir)
    outdir = fullfile(root, 'results', sprintf('sweep_%s_%s_%g', scenario, param, value));
end
run_ablation('scenarios', {scenario}, 'seeds', seeds, 'variants', variants, ...
    'engine', engine, 'outdir', outdir, 'sweep', {param, value});
end

function c = strsplit_(s)
c = {};
rest = s;
while ~isempty(rest)
    [tok, rest] = strtok(rest, ', ');
    if ~isempty(tok), c{end + 1} = tok; end %#ok<AGROW>
end
end
