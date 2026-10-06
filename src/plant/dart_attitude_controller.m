function u = dart_attitude_controller(x, cmd, P) %#codegen
%DART_ATTITUDE_CONTROLLER Acceleration command -> thrust + torques.
%   cmd = [a_des(3); psi_des]. Implements Appendix B (F_d = m(a + g e3),
%   b3d = F_d/|F_d|, desired yaw) with a tilt limit, followed by the
%   geometric attitude controller of Lee, Leok & McClamroch (2010).
m = P(1); g = P(2); J = P(3:5); f_max = P(8); tilt_max = P(12);
kR = P(20:22); kW = P(23:25); drag_comp = P(26); kd_hat = P(27);

v = x(4:6);
w = x(11:13);
R = dart_quat2rotm(x(7:10));

Fd = m * (cmd(1:3) + [0; 0; g]) + drag_comp * kd_hat * v;
% keep a minimum positive vertical force and limit the tilt angle
Fd(3) = max(Fd(3), 0.2 * m * g);
fxy = sqrt(Fd(1)^2 + Fd(2)^2);
fxy_max = Fd(3) * tan(tilt_max);
if fxy > fxy_max
    Fd(1:2) = Fd(1:2) * (fxy_max / fxy);
end
nF = sqrt(Fd(1)^2 + Fd(2)^2 + Fd(3)^2);
if nF > f_max
    Fd = Fd * (f_max / nF);
    nF = f_max;
end

b3 = Fd / nF;
psi = cmd(4);
b1c = [cos(psi); sin(psi); 0];
b2 = dart_cross3(b3, b1c);
b2 = b2 / max(sqrt(b2(1)^2 + b2(2)^2 + b2(3)^2), 1e-9);
b1 = dart_cross3(b2, b3);
Rd = [b1, b2, b3];

E = 0.5 * (Rd.' * R - R.' * Rd);
eR = [E(3, 2); E(1, 3); E(2, 1)];
eW = w;                                  % omega_d = 0 (quasi-static)
tau = -kR .* eR - kW .* eW + dart_cross3(w, J .* w);
f = Fd.' * R(:, 3);
f = min(max(f, 0), f_max);
u = [f; tau];
end
