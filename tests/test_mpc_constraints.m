function test_mpc_constraints()
% MPC: terminal stopping set, and the tangent half-space implies the
% (nonconvex) inflated-sphere constraint along the whole plan.
cfg = dart_default_config();
ob0 = struct('id', [], 'c', zeros(3, 0), 'v', zeros(3, 0), 'P', zeros(6, 6, 0), 'rho', []);
p0 = [0; 0; 2]; v0 = [2; 0; 0];
ti = struct('T_new', 0.2, 'T_period', 0.3);
rk = dart_risk_terms(ob0, p0, v0, cfg);
sol = dart_mpc(p0, v0, zeros(3, 1), [50; 0; 2], ob0, rk, 20, ti, false, [], 0, cfg);
assert(sol.status == 0);
assert(all(abs(sol.V(:, end)) <= cfg.mpc.eps_v + 1e-6), 'terminal stop violated');
assert(all(abs(sol.U(:)) <= repmat(cfg.mpc.a_max, 20, 1) + 1e-6));

P = blkdiag(0.01 * eye(3), 0.01 * eye(3));
ob = struct('id', 1, 'c', [7; 0.2; 2], 'v', zeros(3, 1), 'P', P, 'rho', 0.6);
rk = dart_risk_terms(ob, p0, v0, cfg);
sol = dart_mpc(p0, v0, zeros(3, 1), [50; 0; 2], ob, rk, 30, ti, false, [], 0, cfg);
assert(sol.status == 0 || sol.status == 2);
assert(sol.slack < 1e-4, 'obstacle constraint needed slack');
dmin = min(sqrt(sum((sol.P - ob.c).^2, 1)));
assert(dmin >= ob.rho + cfg.sched.d_s - 1e-6, 'plan enters the inflated obstacle');
end
