function test_horizon()
% Adaptive horizon grows with risk and covers the braking time (Eq. 78).
cfg = dart_default_config();
ss = dart_scheduler_init(cfg); ss.t_last = 0;
sch = struct('T_scan', 0.5, 'tau_hat', 0.1, 'emergency', false);
v = [4; 0; 0];
safe = struct('dc', 20, 'vc', 0.4, 'vcb', 0.5);
risky = struct('dc', 3, 'vc', 3.8, 'vcb', 4);
N1 = dart_horizon(safe, v, ss, sch, 0, cfg);
N2 = dart_horizon(risky, v, ss, sch, 0, cfg);
assert(N2 > N1, 'horizon should grow with risk');
Nb = ceil(norm(v) / cfg.sched.a_b / cfg.mpc.dt);
assert(N1 >= Nb + cfg.mpc.N_margin && N1 >= cfg.mpc.N_min && N2 <= cfg.mpc.N_max);
cfg.mpc.N_mode = 'fixed';
assert(dart_horizon(risky, v, ss, sch, 0, cfg) == cfg.mpc.N_fixed);
end
