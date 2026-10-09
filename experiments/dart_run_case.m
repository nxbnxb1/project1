function res = dart_run_case(variant, scenario, seed, engine, overrides)
%DART_RUN_CASE Run one (variant, scenario, seed) with the chosen engine.
%   engine     'matlab' (default) or 'simulink'
%   overrides  optional function handle cfg = f(cfg) applied last
if nargin < 4 || isempty(engine), engine = 'matlab'; end
cfg = dart_default_config();
cfg = dart_apply_variant(cfg, variant);
if nargin >= 5 && ~isempty(overrides)
    cfg = overrides(cfg);      % also before: the scenario times its movers with cfg.ref.v_des
end
[world, cfg] = dart_scenario(scenario, seed, cfg);
if nargin >= 5 && ~isempty(overrides)
    cfg = overrides(cfg);
end
dart_check_config(cfg);
switch lower(engine)
    case 'matlab'
        res = dart_sim(cfg, world);
    case 'simulink'
        res = dart_run_simulink(cfg, world);
    otherwise
        error('dart:engine', 'Unknown engine %s', engine);
end
end
