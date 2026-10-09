function [a_safe, info] = dart_cbf_filter(a_ref, p, v, ob, rk, cfg, R_IB)
%DART_CBF_FILTER Uncertainty-aware CBF safety filter (Sec. 8, revised).
%
%   For every obstacle within d_active one linear constraint on the
%   commanded acceleration a is built on the ESTIMATED relative state
%   (r = c_hat - p, v_r = v_o_hat - v). Between visual updates the
%   predictor moves c_hat with constant velocity, so the estimate obeys
%   r_dot = v_r, v_r_dot = -a_q exactly; estimation errors are covered by
%   the time-varying inflation d(t) = rho + d_s + beta_s*sigma(t), whose
%   growth rate ddot is known from the covariance propagation.
%
%   cfg.cbf.type = 'braking' (default): braking-distance barrier
%     s = |r| - d,   v_c = -r_hat' v_r,   h = sqrt(2 a_b s) - v_c,
%     h >= 0  <=>  s >= v_c^2/(2 a_b)   (the stopping condition of the
%     scheduler, Eq. 38 with T_open = 0). It has relative degree one and
%     respects the braking capability a_b. hdot >= -alpha h gives
%       r_hat' a <= alpha h - a_b (v_c + ddot)/sqrt(2 a_b s)
%                   + |v_r_perp|^2/|r| - a_bar_o - delta_a .
%   cfg.cbf.type = 'hocbf': second-order barrier h = |r|^2 - d^2 of the
%     original proposal, corrected for the time-varying d(t):
%       2 r'a <= 2|v_r|^2 - 2|r|(a_bar_o + delta_a) - 2 ddot^2 - 2 d dddot
%                + k1 hdot + k0 h,   hdot = 2 r'v_r - 2 d ddot.
%   Blind-motion rows (if R_IB is given and cbf.v_blind < inf): the speed
%   AWAY from the camera's viewing direction f (horizontal optical axis) is
%   kept below v_blind, h = v_blind + f'v, hdot = f'a >= -alpha h, and the
%   speed SIDEWAYS beyond either edge of the field of view (half-angle
%   hfov/2 - fov_margin, outward normal n_e) below v_blind_lat,
%   h = v_blind_lat - n_e'v. Space outside the field of view is not
%   observed; fast motion into it is only as safe as the obstacle memory
%   (Sec. 5.3) - in random worlds most collisions were of this kind.
%   Two HOCBF rows keep the altitude inside [z_min, z_max] (the ground is
%   an obstacle too); they have their own, much heavier slack so that a
%   conflict among obstacle rows can never relax the ground constraint.
%   QP (Eq. 63): min |a - a_ref|_W^2 + w s^2 + w_alt s_alt^2 with a box
%   on a and slacks s, s_alt >= 0, used only if the rows are infeasible.
cb = cfg.cbf;
info = struct('active', false, 'slack', 0, 'slack_alt', 0, 'n', 0, 'h_min', inf, 'status', 0);
a_safe = a_ref;
if ~cb.enabled
    return
end
k1 = cb.p1 + cb.p2;
k0 = cb.p1 * cb.p2;
use = find(rk.dc < cb.d_active);
n = numel(use);
G = zeros(n + 5, 3); h_rhs = zeros(n + 5, 1);
dl = cb.fd_step;
Pq = cfg.est.sigma_p^2 * eye(3);
beta_s = cfg.mpc.beta_s;
a_b = cfg.sched.a_b;
for m = 1:n
    k = use(m);
    r = ob.c(:, k) - p;
    vr = ob.v(:, k) - v;
    nr = norm(r);
    P0 = ob.P(:, :, k);
    q = dart_ob_q(ob, k, cfg);
    s0 = sqrt(dart_lmax_sym3(P0(1:3, 1:3) + Pq));
    s1 = sqrt(dart_lmax_sym3(pos_cov(P0, dl, q) + Pq));
    s2 = sqrt(dart_lmax_sym3(pos_cov(P0, 2 * dl, q) + Pq));
    d = ob.rho(k) + cfg.sched.d_s + beta_s * s0;
    dd = beta_s * (s1 - s0) / dl;
    ddd = beta_s * (s2 - 2 * s1 + s0) / dl^2;
    if strcmp(cb.type, 'hocbf')
        h = nr^2 - d^2;
        hdot = 2 * (r.' * vr) - 2 * d * dd;
        G(m, :) = 2 * r.';
        h_rhs(m) = 2 * (vr.' * vr) - 2 * nr * (cb.a_bar_o + cb.delta_a) - 2 * dd^2 ...
            - 2 * d * ddd + k1 * hdot + k0 * h;
    else
        rh = r / max(nr, 1e-6);
        vc = -(rh.' * vr);
        gap = max(nr - d, cb.s_min);
        h = sqrt(2 * a_b * gap) - vc;
        vperp2 = max(vr.' * vr - vc^2, 0);
        G(m, :) = rh.';
        h_rhs(m) = cb.alpha * h - a_b * (vc + dd) / sqrt(2 * a_b * gap) ...
            + vperp2 / max(nr, 1e-6) - cb.a_bar_o - cb.delta_a;
        if nr - d < cb.s_min
            h = nr - d;                         % inside the inflated set: push out
            h_rhs(m) = min(h_rhs(m), -a_b);
        end
    end
    info.h_min = min(info.h_min, h);
end
info.n = n;
if nargin >= 7 && isfinite(cb.v_blind)
    f = R_IB * cfg.cam.R_BC(:, 3);                % optical axis (inertial)
    f = [f(1:2); 0];
    if norm(f) > 1e-6
        f = f / norm(f);
        n = n + 1;
        G(n, :) = -f.';
        h_rhs(n) = cb.alpha * (cb.v_blind + f.' * v);
        % lateral edges of the field of view: the velocity component beyond
        % each edge (outward normal n_e) is kept below v_blind_lat,
        % h = v_blind_lat - n_e'v, hdot = -n_e'a >= -alpha h
        th = cfg.cam.hfov / 2 - cb.fov_margin;
        for sg = [-1 1]
            ce = cos(sg * th + sg * pi / 2); se = sin(sg * th + sg * pi / 2);
            ne = [ce * f(1) - se * f(2); se * f(1) + ce * f(2); 0];
            n = n + 1;
            G(n, :) = ne.';
            h_rhs(n) = cb.alpha * (cb.v_blind_lat - ne.' * v);
        end
    end
end
n_soft = n;
zl = cfg.mpc.z_lim;
G(n + 1, :) = [0 0 -1]; h_rhs(n + 1) = k1 * v(3) + k0 * (p(3) - zl(1));
G(n + 2, :) = [0 0 1];  h_rhs(n + 2) = -k1 * v(3) + k0 * (zl(2) - p(3));
n = n + 2;
G = G(1:n, :); h_rhs = h_rhs(1:n);

if all(G * a_ref <= h_rhs + 1e-9)
    return                                                   % a_safe = a_nom
end
W = diag(cb.W);
amax = cfg.mpc.a_max;
Hq = blkdiag(W, cb.slack_w, cb.slack_w_alt);
fq = [-W * a_ref; 0; 0];
S = zeros(n, 2);
S(1:n_soft, 1) = -1;                     % obstacle + blind-motion rows
S(n_soft + 1:n, 2) = -1;                 % altitude rows
A = [G, S];
qo = struct('tol', 1e-8, 'maxIter', 60, 'lb', [-amax; 0; 0], 'ub', [amax; inf; inf]);
[z, qi] = dart_qp_solve(Hq, fq, A, h_rhs, [a_ref; 0; 0], qo);
if all(isfinite(z))
    a_safe = min(max(z(1:3), -amax), amax);
    info.slack = max(z(4), 0);
    info.slack_alt = max(z(5), 0);
else
    a_safe = a_ref;
end
info.active = true;
info.status = qi.status;
end

function Pp = pos_cov(P, tau, q)
[F, Q] = dart_cv_model(tau, q);
Pf = F * P * F.' + Q;
Pp = Pf(1:3, 1:3);
end
