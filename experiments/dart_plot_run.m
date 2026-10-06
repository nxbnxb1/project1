function dart_plot_run(res, file)
%DART_PLOT_RUN Map + time histories of one run (scheduler, horizon, safety).
L = res.log; w = res.world; nm = dart_diag_names();
D = @(name) L.dg(strcmp(nm, name), :);
t = L.t;
fig = dart_fig(1300, 900);

subplot(3, 2, [1 2]); hold on; box on;
th = linspace(0, 2*pi, 40);
tend = t(end);
for i = 1:size(w.c0, 2)
    c = w.c0(:, i); 
    if any(w.v(:, i))
        cE = w.c0(:, i) + w.v(:, i) * tend;
        plot([c(1) cE(1)], [c(2) cE(2)], ':', 'Color', [0.6 0.6 0.6]);
        c = cE;
    end
    fill(c(1) + w.rho(i) * cos(th), c(2) + w.rho(i) * sin(th), [0.75 0.75 0.75], 'EdgeColor', [0.4 0.4 0.4]);
end
plot(L.x(1, :), L.x(2, :), 'b-', 'LineWidth', 1.6);
tr = L.trig > 0.5;
plot(L.x(1, tr), L.x(2, tr), 'r.', 'MarkerSize', 8);
plot(w.start(1), w.start(2), 'ks', 'MarkerFaceColor', 'g');
plot(w.goal(1), w.goal(2), 'kp', 'MarkerFaceColor', 'y', 'MarkerSize', 12);
axis equal; xlim([-2, w.goal(1) + 3]); ylim([-9 9]);
xlabel('x [m]'); ylabel('y [m]');
title(sprintf('%s | %s seed %d | %s | %s engine (red dots: depth inferences)', ...
    res.cfg.variant, w.name, w.seed, res.outcome, res.engine), 'Interpreter', 'none');

subplot(3, 2, 3); hold on; box on;
plot(t, D('speed'), 'b'); plot(t, L.clear, 'k');
yline_(0, 'r--');
legend('speed [m/s]', 'true clearance [m]', 'Location', 'best'); xlabel('t [s]');
ylim([min(-0.5, min(L.clear)), max(6, res.cfg.ref.v_des + 1)]);

subplot(3, 2, 4); hold on; box on;
plot(t, 1 ./ max(D('T_scan'), 1e-3), 'm');
stem_t = t(tr);
plot(stem_t, zeros(size(stem_t)), 'r|', 'MarkerSize', 10);
ylabel('scheduled f_v = 1/T_{scan} [Hz]'); xlabel('t [s]');
title(sprintf('%d inferences, %.1f J', res.perc.n_capt, res.perc.e_gpu));

subplot(3, 2, 5); hold on; box on;
plot(t, D('N'), 'k'); plot(t, 10 * D('risk'), 'r');
legend('N_k', '10 \times risk \rho_k', 'Location', 'best'); xlabel('t [s]');

subplot(3, 2, 6); hold on; box on;
plot(t, D('cbf_dev'), 'b'); plot(t, D('emergency'), 'r');
legend('|a_{safe} - a_{mpc}| [m/s^2]', 'emergency', 'Location', 'best'); xlabel('t [s]');

dart_save_fig(fig, file);
end

function yline_(y, style)
xl = xlim; plot(xl, [y y], style);
end
