% CI_OCTAVE  License-free check of the algorithms with GNU Octave.
%   Runs the unit tests (including a short closed-loop run of the full
%   method with the MATLAB engine) and one demo mission with a figure.
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root, 'dart_setup.m'));
warning('off', 'all');
run_all_tests();
out = fullfile(root, 'results', 'octave');
if ~exist(out, 'dir'), mkdir(out); end
res = dart_run_case('E_DART', 'S1', 1, 'matlab');
m = dart_metrics(res);
fprintf('Octave demo S1/E_DART: %s, min clearance %.2f m, %d inferences, t = %.1f s\n', ...
    res.outcome, m.min_clear, m.n_infer, m.t_end);
try
    dart_plot_run(res, fullfile(out, 'demo_S1_E_DART.png'));
catch err
    fprintf('plot skipped: %s\n', err.message);
end
save('-v7', fullfile(out, 'demo_S1_E_DART_metrics.mat'), 'm');
if strcmp(res.outcome, 'collision')
    error('dart:ci', 'collision in the demo mission');
end
