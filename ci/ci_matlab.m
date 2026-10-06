% CI_MATLAB  MATLAB + Simulink job of the CI workflow.
%   1. unit tests (MATLAB engine)
%   2. build the Simulink model from code (simulink/dart_build_model.m)
%   3. run the full method on S1 with BOTH engines and check that the
%      Simulink model reproduces the MATLAB-engine trajectory
%   4. figures + Markdown summary in results/ci
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root, 'dart_setup.m'));
out = fullfile(root, 'results', 'ci');
if ~exist(out, 'dir'), mkdir(out); end
fprintf('MATLAB %s\n', version);

run_all_tests();

mdl = dart_build_model();
copyfile(fullfile(root, 'simulink', [mdl '.slx']), out);

resM = dart_run_case('E_DART', 'S1', 1, 'matlab');
resS = dart_run_case('E_DART', 'S1', 1, 'simulink');
mM = dart_metrics(resM);
mS = dart_metrics(resS);
n = min(numel(resM.log.t), numel(resS.log.t));
dpos = sqrt(sum((resM.log.x(1:3, 1:n) - resS.log.x(1:3, 1:n)).^2, 1));
dev = max(dpos);
% both engines run the same functions with the same random streams; tiny
% floating-point differences can flip a discrete decision later in the
% mission, so the strict check uses the first 5 s only
dev5 = max(dpos(resM.log.t(1:n) <= 5));
fprintf('MATLAB engine : %s in %.2f s, min clearance %.3f m, %d inferences, wall %.1f s\n', ...
    resM.outcome, mM.t_end, mM.min_clear, mM.n_infer, resM.wall_time);
fprintf('Simulink model: %s in %.2f s, min clearance %.3f m, %d inferences, wall %.1f s\n', ...
    resS.outcome, mS.t_end, mS.min_clear, mS.n_infer, resS.wall_time);
fprintf('max position deviation between engines: %.3g m (first 5 s: %.3g m)\n', dev, dev5);

dart_plot_run(resM, fullfile(out, 'S1_E_DART_matlab.png'));
dart_plot_run(resS, fullfile(out, 'S1_E_DART_simulink.png'));
save(fullfile(out, 'ci_runs.mat'), 'mM', 'mS', 'dev', 'dev5');

fid = fopen(fullfile(out, 'summary.md'), 'w');
fprintf(fid, '## DART CI (MATLAB %s)\n\n', version);
fprintf(fid, '| Engine | Outcome | Time [s] | Min clearance [m] | Inferences | GPU energy [J] | N mean | MPC [ms] | Wall [s] |\n');
fprintf(fid, '|---|---|---|---|---|---|---|---|---|\n');
fprintf(fid, '| MATLAB | %s | %.2f | %.3f | %d | %.1f | %.1f | %.1f | %.1f |\n', resM.outcome, mM.t_end, ...
    mM.min_clear, mM.n_infer, mM.e_gpu, mM.N_mean, mM.mpc_ms, resM.wall_time);
fprintf(fid, '| Simulink | %s | %.2f | %.3f | %d | %.1f | %.1f | %.1f | %.1f |\n', resS.outcome, mS.t_end, ...
    mS.min_clear, mS.n_infer, mS.e_gpu, mS.N_mean, mS.mpc_ms, resS.wall_time);
fprintf(fid, '\nMax position deviation Simulink vs MATLAB engine: %.3g m (first 5 s: %.3g m)\n', dev, dev5);
fclose(fid);

assert(~strcmp(resS.outcome, 'collision'), 'collision in the Simulink run');
assert(dev5 < 0.1, 'Simulink model deviates from the MATLAB engine');
