function x = dart_rk4(x, u, t, dt, P)
%DART_RK4 One RK4 step of DART_QUAD_DYNAMICS with zero-order-held input.
k1 = dart_quad_dynamics(x, u, t, P);
k2 = dart_quad_dynamics(x + 0.5*dt*k1, u, t + 0.5*dt, P);
k3 = dart_quad_dynamics(x + 0.5*dt*k2, u, t + 0.5*dt, P);
k4 = dart_quad_dynamics(x + dt*k3, u, t + dt, P);
x = x + dt/6 * (k1 + 2*k2 + 2*k3 + k4);
end
