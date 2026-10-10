function xdot = dart_quad_dynamics(x, u, t, P) %#codegen
%DART_QUAD_DYNAMICS Continuous-time 6-DOF quadrotor model (ENU / FLU).
%   x = [p(3); v(3); q(4) body->inertial [w x y z]; omega(3) body rates;
%        f (actual collective thrust); tau(3) (actual body torques)]   (17)
%   u = [f_cmd; tau_cmd(3)]
%
%   m pdd = -m g e3 + f R e3 - kd v_a - cq |v_a| v_a,  v_a = v - w_wind
%   (linear rotor drag + quadratic body drag)
%   J omegad = tau - omega x J omega
%   thrust and torques follow their commands with a first-order lag.
m = P(1); g = P(2); J = P(3:5); kd = P(6); tau_m = P(7);
f_max = P(8); tau_lim = P(9:11);
wind = P(13:15) + P(16:18) .* sin(2*pi*P(19)*t + [0; 1.3; 2.1]);

v = x(4:6);
q = x(7:10);
w = x(11:13);
f = x(14);
tau = x(15:17);

R = dart_quat2rotm(q);
va = v - wind;
cq = P(28);
vdot = [0; 0; -g] + (f / m) * R(:, 3) - (kd / m) * va - (cq / m) * sqrt(va(1)^2 + va(2)^2 + va(3)^2) * va;

% quaternion kinematics with a normalisation-stabilising term
qn2 = q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2;
qdot = 0.5 * [-q(2:4).' * w; q(1) * w + dart_cross3(q(2:4), w)] + 1.0 * (1 - qn2) * q;

wdot = (tau - dart_cross3(w, J .* w)) ./ J;

f_c = min(max(u(1), 0), f_max);
tau_c = min(max(u(2:4), -tau_lim), tau_lim);
fdot = (f_c - f) / tau_m;
taudot = (tau_c - tau) / tau_m;

xdot = [v; vdot; qdot; wdot; fdot; taudot];
end
