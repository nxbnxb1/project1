function test_closed_loop_short()
% Short closed-loop run of the full method (MATLAB engine): no collision,
% progress toward the goal, perception actually scheduled.
cfg = dart_default_config();
cfg = dart_apply_variant(cfg, 'E_DART');
[world, cfg] = dart_scenario('S1', 1, cfg);
cfg.sim.t_max = 5;
res = dart_sim(cfg, world);
assert(~strcmp(res.outcome, 'collision'), 'collision in the short run');
assert(~strcmp(res.outcome, 'diverged'));
assert(res.log.x(1, end) > 5, 'no progress toward the goal');
assert(res.perc.n_capt >= 3, 'perception never triggered');
m = dart_metrics(res);
assert(m.min_clear > 0);
end
