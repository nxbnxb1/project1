function S = dart_eval_speed_density(variant, scenario, seed, param, value)
%DART_EVAL_SPEED_DENSITY Flown speed and perception rate versus the local
%   obstacle density along one mission: the time is binned by the number of
%   distinct objects within 15 m of the vehicle (0, 1-2, 3-5, >= 6).
%   Example: dart_eval_speed_density('E_COV', 'SN', 1, 'speed', 15)
res = dart_run_case(variant, scenario, seed, 'matlab', @(c) dart_apply_sweep(c, param, value));
L = res.log; w = res.world;
idx = 1:10:numel(L.t);
dt = 10 * (L.t(2) - L.t(1));
n15 = zeros(1, numel(idx));
if ~isempty(w.rho)
    D = dart_world_sdf(w, L.x(1:3, idx), 0);
    for j = 1:numel(idx)
        n15(j) = numel(unique(w.obj(D(:, j) < 15)));
    end
end
v = sqrt(sum(L.x(4:6, idx).^2, 1));
tr = zeros(1, numel(idx));
for j = 1:numel(idx), tr(j) = sum(L.trig(idx(j):min(idx(j) + 9, numel(L.t)))); end
fprintf('%s %s seed %d %s=%g: %s t=%.1f inf=%d minclr=%.2f\n', variant, scenario, seed, param, value, ...
    res.outcome, L.t(end), sum(L.trig), min(L.clear));
B = {[0 0], [1 2], [3 5], [6 inf]};
S = struct('bin', B, 'time', 0, 'speed', NaN, 'rate', 0);
for i = 1:numel(B)
    in = n15 >= B{i}(1) & n15 <= B{i}(2);
    S(i).time = sum(in) * dt;
    S(i).speed = mean(v(in));
    S(i).rate = sum(tr(in)) / max(S(i).time, 1e-6);
    fprintf('  objects within 15 m %d-%g: %5.1f s, mean speed %5.2f m/s, %.2f frames/s\n', B{i}(1), B{i}(2), ...
        S(i).time, S(i).speed, S(i).rate);
end
end
