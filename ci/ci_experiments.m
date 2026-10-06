function ci_experiments(scenarios, seeds, variants, engine, outdir)
%CI_EXPERIMENTS Entry point of the experiments workflow (one matrix job).
%   ci_experiments('S1', '1:10', 'all', 'matlab', 'results/ablation_S1')
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root, 'dart_setup.m'));
warning('off', 'all');
if ischar(scenarios), scenarios = strsplit_(scenarios); end
if ischar(seeds), seeds = eval(seeds); end
if ischar(variants)
    if strcmpi(variants, 'all'), variants = dart_variant_list(); else, variants = strsplit_(variants); end
end
if nargin < 5 || isempty(outdir), outdir = fullfile(root, 'results', 'ablation'); end
run_ablation('scenarios', scenarios, 'seeds', seeds, 'variants', variants, ...
    'engine', engine, 'outdir', outdir);
end

function c = strsplit_(s)
c = {};
rest = s;
while ~isempty(rest)
    [tok, rest] = strtok(rest, ', ');
    if ~isempty(tok), c{end + 1} = tok; end %#ok<AGROW>
end
end
