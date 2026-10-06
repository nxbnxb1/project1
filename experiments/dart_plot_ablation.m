function dart_plot_ablation(S, figdir)
%DART_PLOT_ABLATION Bar charts of the main trade-offs per scenario.
scen = {};
for i = 1:numel(S)
    if ~any(strcmp(scen, S(i).scenario)), scen{end + 1} = S(i).scenario; end %#ok<AGROW>
end
keys = {'success', 'min_clear', 'n_infer', 'e_gpu', 'N_mean', 'mpc_cost', 't_end', 'est_err'};
labels = {'success rate', 'min clearance [m]', '# depth inferences', 'GPU energy [J]', ...
          'mean horizon N', 'relative QP cost', 'mission time [s]', 'track error [m]'};
for s = 1:numel(scen)
    idx = find(strcmp({S.scenario}, scen{s}));
    names = {S(idx).variant};
    fig = dart_fig(1400, 700);
    for k = 1:numel(keys)
        subplot(2, 4, k); hold on; box on;
        mu = [S(idx).([keys{k} '_mean'])];
        sd = [S(idx).([keys{k} '_std'])];
        bar(1:numel(mu), mu, 0.6, 'FaceColor', [0.35 0.55 0.85]);
        for b = 1:numel(mu)                      % error bars (portable MATLAB/Octave)
            if isfinite(sd(b)), plot([b b], mu(b) + [-sd(b) sd(b)], 'k-', 'LineWidth', 1.2); end
        end
        set(gca, 'XTick', 1:numel(mu), 'XTickLabel', strrep(names, '_', '-'));
        try, set(gca, 'XTickLabelRotation', 45); catch, end
        title(labels{k});
    end
    dart_save_fig(fig, fullfile(figdir, sprintf('ablation_%s.png', scen{s})));
end
end
