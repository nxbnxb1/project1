function ci_debug_case(variant, scenario, seed, param, value)
%CI_DEBUG_CASE Re-run one case with the MATLAB engine and print a trace of
%   the last seconds before the end of the run (collision / timeout).
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root, 'dart_setup.m'));
if ischar(seed), seed = str2double(seed); end
if ischar(value), value = str2double(value); end
res = dart_run_case(variant, scenario, seed, 'matlab', @(c) apply(c, param, value));
L = res.log; nm = dart_diag_names();
G = zeros(7, numel(L.t));
cols = {'N', 'T_scan', 'emergency', 'cbf_active', 'cbf_dev', 'cbf_slack', 'mpc_status'};
for i = 1:numel(cols), G(i, :) = L.dg(strcmp(nm, cols{i}), :); end
fprintf('\n%s %s seed %d (%s=%g): %s at t = %.2f s, min clearance %.3f m\n', variant, scenario, ...
    seed, param, value, res.outcome, L.t(end), min(L.clear));
k1 = max(1, numel(L.t) - 400);
fprintf(['   t     x      y     z   |v|  closing | obs clr   trk st  err   sig  drho fov |' ...
    ' N  Tscan  em cbf  dev   slack mpcst\n']);
for k = [k1:10:numel(L.t), numel(L.t)]
    g = L.dbg(:, k);
    fprintf('%6.2f %6.2f %6.2f %4.2f %4.2f %6.2f | %3d %5.2f  %d  %d  %5.2f %4.2f %5.2f %d | %2d %5.2f %d  %d  %5.2f %6.3f %d\n', ...
        L.t(k), L.x(1:3, k), g(8), g(9), g(1), g(2), g(3), g(10), g(4), g(5), g(6), g(7), G(:, k));
end
out = fullfile(root, 'results', 'debug');
if ~exist(out, 'dir'), mkdir(out); end
dart_plot_run(res, fullfile(out, sprintf('debug_%s_%s_%d.png', variant, scenario, seed)));
save(fullfile(out, sprintf('debug_%s_%s_%d.mat', variant, scenario, seed)), 'res');
end

function c = apply(c, param, value)
c = dart_apply_sweep(c, param, value);
c.sim.debug = true;
end
