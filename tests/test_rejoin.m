function test_rejoin()
% Set path + TRACK / REJOIN logic (Sec. 9.1): an obstacle on the path
% ahead starts a detour whose rejoin point is the earliest point of the
% path behind the blocked stretch; the redrawn reference goes from the
% current position straight to that point; back to TRACK once rejoined.
cfg = dart_default_config();
G = dart_path_init([0 20 20; 0 0 10; 2 2 2]);         % L-shaped polyline
[p, tg] = dart_path_point(G, [5 25]);
assert(norm(p(:, 1) - [5; 0; 2]) < 1e-12 && norm(p(:, 2) - [20; 5; 2]) < 1e-12);
assert(norm(tg(:, 2) - [0; 1; 0]) < 1e-12);
[s, e] = dart_path_project(G, [21; 3; 2], 15, 30);
assert(abs(s - 23) < 1e-12 && abs(e - 1) < 1e-12);

G = dart_path_init([0 50; 0 0; 2 2]);
ob = struct('c', [10; 0.3; 2], 'v', zeros(3, 1), 'P', blkdiag(0.01 * eye(3), 1e-4 * eye(3)), ...
    'rho', 0.6, 'q', 1e-4, 'static', true, 'id', 1);
d = ob.rho + cfg.sched.d_s + cfg.mpc.beta_s * 0.1 + cfg.ref.margin;
rj = struct('mode', 1, 's0', 0, 'e_lat', 0, 's_r', 0, 'n_rejoin', 0);
rj = dart_rejoin_update(rj, G, [6; 0; 2], ob, cfg);
assert(rj.mode == 2 && rj.n_rejoin == 1, 'obstacle on the path must start a detour');
s_exp = 10 + sqrt(d^2 - 0.3^2) + cfg.ref.m_rejoin;   % end of the blocked stretch + margin
assert(abs(rj.s_r - s_exp) < cfg.ref.ds + 1e-9, 'rejoin point is not the earliest clear point');
% redrawn reference: from the CURRENT (off-path) position towards Gamma(s_r)
p0 = [7; 1.5; 2];
rj = dart_rejoin_update(rj, G, p0, ob, cfg);
[pr, ~, target] = dart_reference_path(p0, G, rj, 10, 0.1, cfg.ref.v_des, cfg.ref.a_dec, cfg.ref.L_look);
assert(norm(target - [rj.s_r; 0; 2]) < 1e-9);
u = (target - p0) / norm(target - p0);
assert(norm(pr(:, 1) - (p0 + u * cfg.ref.v_des * 0.1)) < 1e-9, 'reference must start at the vehicle');
% a far obstacle does not start a detour; obstacle passed + on the path -> TRACK
ob2 = ob; ob2.c = [10 + cfg.ref.L_trig + 6; 0; 2];
rj2 = dart_rejoin_update(struct('mode', 1, 's0', 0, 'e_lat', 0, 's_r', 0, 'n_rejoin', 0), G, [6; 0; 2], ob2, cfg);
assert(rj2.mode == 1, 'blocked stretch beyond L_trig must not start a detour yet');
rj = dart_rejoin_update(rj, G, [rj.s_r + 0.1; 0.1; 2], ob, cfg);
assert(rj.mode == 1, 'back on the path behind the obstacle: TRACK');
% pushed off a clear path -> short rejoin just ahead
rj = dart_rejoin_update(rj, G, [rj.s0 + 1; cfg.ref.e_off + 0.2; 2], ob, cfg);
assert(rj.mode == 2 && abs(rj.s_r - (rj.s0 + cfg.ref.L_min)) < 1e-9);
end
