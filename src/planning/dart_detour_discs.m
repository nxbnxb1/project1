function [C, r] = dart_detour_discs(p0, q, ob, cfg)
%DART_DETOUR_DISCS Obstacles as discs in the horizontal plane z = p0(3).
%   Radius d_k = rho_k + d_s + ref.margin + |v_k| ref.T_move: the body
%   clearance plus an allowance for the motion of dynamic obstacles, but
%   WITHOUT the uncertainty inflation beta_s sigma_k. The plan is made at
%   long range, where sigma is large and the inflated cylinders would close
%   every gap of a cluster (the vehicle would be sent around the whole
%   cluster); sigma shrinks as the vehicle approaches, and the MPC and CBF
%   enforce the uncertainty-inflated constraints. Obstacles are vertical
%   cylinders (DART_CYL_DIST): one whose vertical extent contains z gives a
%   disc of radius rho + m (m = d_k - rho_k the clearance), one above or
%   below the plane by dz < m a disc of radius rho + sqrt(m^2 - dz^2) (the
%   rounded edge of the inflated cylinder), one farther away none (it is
%   flown over / under). Only obstacles near the segment p0 -> q are
%   returned.
rf = cfg.ref;
z = p0(3);
C = zeros(2, 0); r = zeros(1, 0);
reach = norm(q(1:2) - p0(1:2)) + 3;
for k = 1:numel(ob.rho)
    m = cfg.sched.d_s + rf.margin + norm(ob.v(1:2, k)) * rf.T_move;
    if isfield(ob, 'zl')
        dz = max([ob.zl(k) - z, z - ob.zh(k), 0]);
        if dz >= m, continue, end
        d = ob.rho(k) + sqrt(m^2 - dz^2);
    else                                          % plain spheres
        d = ob.rho(k) + m;
        dz = ob.c(3, k) - z;
        if abs(dz) >= d, continue, end
        d = sqrt(d^2 - dz^2);
    end
    ck = ob.c(1:2, k);
    if norm(ck - p0(1:2)) > reach + d && norm(ck - q(1:2)) > reach + d, continue, end
    C(:, end + 1) = ck; %#ok<AGROW>
    r(end + 1) = d; %#ok<AGROW>
end
end
