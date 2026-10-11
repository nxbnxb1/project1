function D = dart_eval_speed_density(variant, scenario, seed, param, value)
%DART_EVAL_SPEED_DENSITY Flown speed and perception rate versus the local
%   obstacle density along one mission (DART_DENSITY_PROFILE: number of
%   distinct objects within 15 m of the vehicle, bins 0, 1-2, 3-5, >= 6).
%   Example: dart_eval_speed_density('E_COV', 'SN', 1, 'speed', 15)
res = dart_run_case(variant, scenario, seed, 'matlab', @(c) dart_apply_sweep(c, param, value));
L = res.log;
D = dart_density_profile(res);
fprintf('%s %s seed %d %s=%g: %s t=%.1f inf=%d minclr=%.2f\n', variant, scenario, seed, param, value, ...
    res.outcome, L.t(end), sum(L.trig), min(L.clear));
B = {'0', '1-2', '3-5', '>=6'};
for k = 1:4
    fprintf('  objects within 15 m %-3s: %5.1f s, mean speed %5.2f m/s, %.2f frames/s\n', B{k}, ...
        D(k, 1), D(k, 2) / max(D(k, 1), 1e-9), D(k, 3) / max(D(k, 1), 1e-9));
end
end
