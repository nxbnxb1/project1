function test_cbf_filter()
% HOCBF filter: inactive far away, corrective and constraint-satisfying near.
cfg = dart_default_config();
P = blkdiag(0.01 * eye(3), 0.01 * eye(3));
p = [0; 0; 2]; v = [3; 0; 0];
far = struct('id', 1, 'c', [30; 0; 2], 'v', zeros(3, 1), 'P', P, 'rho', 0.5);
rk = dart_risk_terms(far, p, v, cfg);
a = dart_cbf_filter([2; 0; 0], p, v, far, rk, cfg);
assert(norm(a - [2; 0; 0]) < 1e-12, 'filter should be inactive');
near = struct('id', 1, 'c', [2.2; 0; 2], 'v', zeros(3, 1), 'P', P, 'rho', 0.5);
rk = dart_risk_terms(near, p, v, cfg);
[a, info] = dart_cbf_filter([2; 0; 0], p, v, near, rk, cfg);
assert(info.active, 'filter should be active');
assert(a(1) < 0, 'filter should brake');
assert(all(abs(a) <= cfg.mpc.a_max + 1e-6));
cfg.cbf.enabled = false;
a = dart_cbf_filter([2; 0; 0], p, v, near, rk, cfg);
assert(isequal(a, [2; 0; 0]));
end
