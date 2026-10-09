function test_tradeoff()
% The safety <-> time-to-goal hyperparameter: kappa = 0.5 reproduces the
% nominal configuration, smaller kappa enlarges every margin, larger kappa
% shrinks them, and applying it twice changes nothing.
cfg = dart_apply_variant(dart_default_config(), 'E_DART');
c5 = dart_apply_tradeoff(cfg);
f = {'beta_s', 'cbf_alpha', 'd_s', 'v_blind', 'v_blind_lat', 'ref_margin'};
get = @(c) [c.mpc.beta_s, c.cbf.alpha, c.sched.d_s, c.cbf.v_blind, c.cbf.v_blind_lat, c.ref.margin];
nm = cfg.tradeoff.nominal;
assert(norm(get(c5) - cellfun(@(n) nm.(n), f)) < 1e-12, 'kappa = 0.5 must be the nominal configuration');
c0 = cfg; c0.tradeoff.kappa = 0; c0 = dart_apply_tradeoff(c0);
c1 = cfg; c1.tradeoff.kappa = 1; c1 = dart_apply_tradeoff(c1);
safer = [1 -1 1 -1 -1 1];            % sign of (conservative - nominal)
assert(all(sign(get(c0) - get(c5)) == safer) && all(sign(get(c1) - get(c5)) == -safer));
assert(isequal(get(dart_apply_tradeoff(c0)), get(c0)), 'not idempotent');
k = dart_apply_variant(dart_default_config(), 'K25');
assert(abs(k.tradeoff.kappa - 0.25) < 1e-12 && k.cbf.enabled);
a = dart_apply_variant(dart_default_config(), 'A_FR_FN');
a.tradeoff.kappa = 0; a = dart_apply_tradeoff(a);
assert(a.mpc.beta_s == 0, 'variants without the safety layers keep beta_s = 0');
end
