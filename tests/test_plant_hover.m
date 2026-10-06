function test_plant_hover()
% 6-DOF plant + attitude loop: hover is an equilibrium; a commanded
% acceleration is reached within ~0.2 s.
cfg = dart_default_config();
P = dart_plant_vector(cfg);
x = dart_quad_init_state([0; 0; 2], 0.3, cfg);
dt = cfg.sim.dt_plant;
for k = 1:500
    x = dart_rk4(x, dart_attitude_controller(x, [0; 0; 0; 0.3], P), (k - 1) * dt, dt, P);
end
assert(norm(x(1:3) - [0; 0; 2]) < 1e-6 && abs(norm(x(7:10)) - 1) < 1e-9);
a_cmd = [2; -1; 0.5];
for k = 1:150
    u = dart_attitude_controller(x, [a_cmd; 0.3], P);
    xd = dart_quad_dynamics(x, u, 0, P);
    x = dart_rk4(x, u, 0, dt, P);
end
assert(norm(xd(4:6) - a_cmd) < 0.15, 'acceleration tracking error too large');
end
