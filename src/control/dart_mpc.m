function sol = dart_mpc(p0, v0, u_prev, goal, ob, rk, N, tinfo, v_cap, prev, t, cfg)
%DART_MPC Perception-aware adaptive-horizon MPC (Sec. 9), one solve.
%
%   Double-integrator prediction (Eq. 65), condensed into a dense QP in the
%   stacked accelerations U. Obstacle constraints use a tangent half-space
%   of the inflated sphere (Eq. 82-85 revised):
%       g_ij = n_ij' (p_j - c_ij) - d_eff,ij ,   ||n_ij|| = 1
%   which is linear in U and sufficient for ||p_j - c_ij|| >= d_eff,ij for
%   ANY unit n_ij. n_ij is taken at the previous solution (recursive
%   feasibility) and tilted sideways for head-on encounters (no deadlock).
%   Each step j carries a direct row and, for the first N_dcbf steps, a
%   discrete-time CBF row; both use the same plane (n_ij, c_ij):
%       direct  :  g_ij(p_j)               >= -s_i                 (Eq. 84)
%       DCBF    :  g_ij(p_j) >= (1-gamma) g_ij(p_j-1) - s_i         (Eq. 85)
%   (evaluating both points against the SAME plane keeps the DCBF row
%   consistent when the normal changes along the horizon), s_i >= 0.
%   Terminal set: ||v_N||_inf <= eps_v (safe stopping set).
%
%   tinfo.T_new     time until the next visual result arrives (Eq. 75)
%   tinfo.T_period  expected period of later results (max(T_scan, tau_hat))
%   v_cap           reference-speed cap (emergency mode), inf otherwise

mp = cfg.mpc;
dt = mp.dt;
tic_id = tic;

% ------------------------------------------------------------ reference
v_des = min(cfg.ref.v_des, v_cap);
[pr, vr] = dart_reference(p0, goal, N, dt, v_des, cfg.ref.a_dec);

% ------------------------------------------------ condensed prediction
jj = (1:N).';
[J, K] = ndgrid(1:N, 1:N);
Lp = (K <= J) .* (dt^2 * (J - K + 0.5));
Lv = (K <= J) * dt;
I3 = eye(3);
Gp = kron(Lp, I3);
Gv = kron(Lv, I3);
pf = repmat(p0, N, 1) + kron(jj * dt, v0);
vf = repmat(v0, N, 1);

Qp = kron(eye(N), diag(mp.Qp));
Qv = kron(eye(N), diag(mp.Qv));
Rb = kron(eye(N), diag(mp.R));
Sb = kron(eye(N), diag(mp.S));
Dm = eye(3 * N) - [zeros(3, 3 * N); eye(3 * (N - 1)), zeros(3 * (N - 1), 3)];
e0 = [u_prev; zeros(3 * N - 3, 1)];
HU = Gp.' * Qp * Gp + Gv.' * Qv * Gv + Rb + Dm.' * Sb * Dm;
fU = Gp.' * Qp * (pf - pr(:)) + Gv.' * Qv * (vf - vr(:)) - Dm.' * Sb * e0;

% --------------------------------------------- linearisation trajectory
pbar = linearisation_traj(prev, p0, v0, N, dt, t);

% ------------------------------------------------- obstacle selection
sel = [];
if ~isempty(rk.dc)
    reach = norm(mp.v_max) * N * dt + mp.relevance;
    cand = find(rk.dc - cfg.sched.d_s < reach);
    [~, o] = sort(rk.dc(cand));
    sel = cand(o(1:min(numel(o), mp.M_obs)));
end
ns = numel(sel);
nU = 3 * N;
nz = nU + ns;

% ------------------------------------------------------- constraints
% inputs and slacks: simple bounds (handled natively by the solver)
amax = repmat(mp.a_max, N, 1);
lbz = [-amax; zeros(ns, 1)];
ubz = [amax; inf(ns, 1)];
% velocity box on every 2nd step, altitude box, terminal stopping set
jv_rows = 2:2:N;
iv = reshape([3 * jv_rows - 2; 3 * jv_rows - 1; 3 * jv_rows], [], 1);
% if the current state is outside a box, the bound is relaxed only by what
% full-rate braking cannot remove yet (no ratchet across re-solves)
vmax = zeros(3 * numel(jv_rows), 1);
for q = 1:numel(jv_rows)
    vmax(3 * q - 2:3 * q) = max(mp.v_max, abs(v0) - mp.a_max * jv_rows(q) * dt + 0.05);
end
zr = 3:3:nU;
zmin = min(mp.z_lim(1), p0(3) - max(-v0(3), 0)^2 / (2 * mp.a_max(3)) - 0.05);
zmax = max(mp.z_lim(2), p0(3) + max(v0(3), 0)^2 / (2 * mp.a_max(3)) + 0.05);
use_dcbf = mp.gamma < 1;
n_dcbf = use_dcbf * min(mp.N_dcbf, N);

nv = numel(iv);
nrow = 2 * nv + 2 * N + 6 * mp.terminal_stop + ns * (N + n_dcbf);
A = zeros(nrow, nz);
b = zeros(nrow, 1);
r = 0;
A(r + (1:nv), 1:nU) = Gv(iv, :);  b(r + (1:nv)) = vmax - vf(iv); r = r + nv;
A(r + (1:nv), 1:nU) = -Gv(iv, :); b(r + (1:nv)) = vmax + vf(iv); r = r + nv;
A(r + (1:N), 1:nU) = Gp(zr, :);  b(r + (1:N)) = zmax - pf(zr);  r = r + N;
A(r + (1:N), 1:nU) = -Gp(zr, :); b(r + (1:N)) = -zmin + pf(zr); r = r + N;
if mp.terminal_stop
    GvN = Gv(nU - 2:nU, :);
    A(r + (1:3), 1:nU) = GvN;  b(r + (1:3)) = mp.eps_v - v0; r = r + 3;
    A(r + (1:3), 1:nU) = -GvN; b(r + (1:3)) = mp.eps_v + v0; r = r + 3;
end

travel = goal - p0;
if norm(travel) > 1e-6, travel = travel / norm(travel); else, travel = [1; 0; 0]; end
gam = mp.gamma;
dmin_all = inf;
for s = 1:ns
    k = sel(s);
    c0 = ob.c(:, k); vo = ob.v(:, k);
    sig = horizon_sigma(ob.P(:, :, k), N, dt, tinfo, c0, vo, ob.rho(k), pbar, travel, cfg);
    d = ob.rho(k) + cfg.sched.d_s + mp.beta_s * sig;            % Eq. 82, j = 0..N
    for j = 1:N
        cj = c0 + vo * (j * dt);
        nj = tangent_normal(pbar(:, j) - cj, travel, mp.side_angle);
        idx = 3 * j - 2:3 * j;
        rowj = nj.' * Gp(idx, :);
        kapj = nj.' * (pf(idx) - cj) - d(j + 1);
        r = r + 1;                                   % direct: g_j >= -s
        A(r, 1:nU) = -rowj;
        A(r, nU + s) = -1;
        b(r) = kapj;
        if j <= n_dcbf                               % same-plane DCBF row
            cprev = c0 + vo * ((j - 1) * dt);
            if j == 1
                rowp = zeros(1, nU);
                kapp = nj.' * (p0 - cprev) - d(j);
            else
                rowp = nj.' * Gp(idx - 3, :);
                kapp = nj.' * (pf(idx - 3) - cprev) - d(j);
            end
            r = r + 1;
            A(r, 1:nU) = (1 - gam) * rowp - rowj;
            A(r, nU + s) = -1;
            b(r) = kapj - (1 - gam) * kapp;
        end
    end
    dmin_all = min(dmin_all, norm(p0 - c0) - d(1));
end

H = blkdiag(HU, 2 * mp.slack_w2 * eye(ns));
f = [fU; mp.slack_w1 * ones(ns, 1)];

% --------------------------------------------------------------- solve
z0 = zeros(nz, 1);
if ~isempty(prev) && isfield(prev, 'U') && ~isempty(prev.U)
    Ush = prev.U(:, min(2:size(prev.U, 2) + 1, size(prev.U, 2)));
    Ush = [Ush, repmat(Ush(:, end), 1, max(N - size(Ush, 2), 0))];
    z0(1:nU) = reshape(Ush(:, 1:N), [], 1);
end
use_qp = strcmp(mp.solver, 'quadprog') && exist('quadprog', 'file') == 2;
if use_qp
    opts = optimoptions('quadprog', 'Display', 'off', 'Algorithm', 'interior-point-convex');
    [z, ~, flag, outp] = quadprog(0.5 * (H + H.'), f, A, b, [], [], lbz, ubz, [], opts);
    status = double(flag ~= 1);
    iter = outp.iterations;
    if isempty(z), z = z0; status = 3; end
else
    [z, inf_] = dart_qp_solve(H, f, A, b, z0, struct('tol', 1e-6, 'maxIter', 50, 'lb', lbz, 'ub', ubz));
    status = inf_.status; iter = inf_.iter;
    if status ~= 0 && all(isfinite(z)) && inf_.res(1) < 1e-4 * (1 + norm(b, inf)) ...
            && inf_.res(2) < 1e-3 * (1 + norm(f, inf))
        status = 2;                                             % inaccurate but usable
    end
end

if (status == 0 || status == 2) && all(isfinite(z))
    U = reshape(z(1:nU), 3, N);
    slack = max([0; z(nU + 1:end)]);
else
    U = braking_profile(v0, N, dt, cfg);
    slack = NaN;
end
Pst = reshape(pf + Gp * U(:), 3, N);
Vst = reshape(vf + Gv * U(:), 3, N);

sol = struct('t0', t, 'dt', dt, 'N', N, 'U', U, 'P', Pst, 'V', Vst, ...
    'p0', p0, 'status', status, 'iter', iter, 'time', toc(tic_id), ...
    'nrow', nrow, 'nvar', nz, 'slack', slack, 'n_obs', ns, 'dmin0', dmin_all);
end

% =====================================================================
function pbar = linearisation_traj(prev, p0, v0, N, dt, t)
pbar = p0 + v0 * ((1:N) * dt);
if isempty(prev) || ~isfield(prev, 'P') || isempty(prev.P), return, end
tp = prev.t0 + (0:prev.N) * prev.dt;
Pp = [prev.p0, prev.P];
tq = t + (1:N) * dt;
for a = 1:3
    pbar(a, :) = interp1(tp, Pp(a, :), min(tq, tp(end)), 'linear');
end
% re-anchor at the current position (estimate jumps, disturbances)
pbar = pbar + (p0 - interp1(tp, Pp.', min(t, tp(end)), 'linear').');
end

function sig = horizon_sigma(P0, N, dt, tinfo, c0, vo, rho, pbar, travel, cfg)
%HORIZON_SIGMA Position std of an obstacle along the horizon. Covariance
%   grows with the CV model and is reset at the steps where a visual result
%   is EXPECTED (Eq. 79-80): first at j_v = ceil(T_new/dt), then every
%   T_period, provided the obstacle is predicted to be inside the FOV. Only
%   the covariance is corrected; the mean is never updated with an unknown
%   innovation (causality).
[F, Q] = dart_cv_model(dt, cfg.trk.q_acc);
Pq = cfg.est.sigma_p^2 * eye(3);
H = [eye(3), zeros(3)];
jv = max(1, ceil(tinfo.T_new / dt - 1e-9));
np = max(1, ceil(tinfo.T_period / dt - 1e-9));
sig = zeros(1, N + 1);
P = P0;
sig(1) = sqrt(dart_lmax_sym3(P(1:3, 1:3) + Pq));
for j = 1:N
    P = F * P * F.' + Q;
    if cfg.mpc.expected_reset && j >= jv && mod(j - jv, np) == 0
        cj = c0 + vo * (j * dt);
        pj = pbar(:, j);
        if j > 1, hd = pbar(:, j) - pbar(:, j - 1); else, hd = travel; end
        if norm(hd(1:2)) < 1e-3, hd = travel; end
        psi = atan2(hd(2), hd(1));
        Rz = [cos(psi) -sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1];
        if dart_in_fov(cj, pj, Rz, cfg, 5 * pi/180)
            Rv = dart_expected_meas_cov(norm(cj - pj), rho, cfg);
            K = P * H.' / (H * P * H.' + Rv);
            P = (eye(6) - K * H) * P;                                   % Eq. 80
        end
    end
    sig(j + 1) = sqrt(dart_lmax_sym3(P(1:3, 1:3) + Pq));
end
end

function n = tangent_normal(w, travel, max_ang)
%TANGENT_NORMAL Unit normal of the separating half-space. If the normal
%   points (almost) against the direction of travel, it is rotated toward
%   the side the vehicle is already on so that the plane can be passed.
n = unit(w, -travel);
c = -(n.' * travel);                     % cos(angle(n, -travel))
if c > cos(max_ang)
    side = n + c * travel;               % component orthogonal to travel
    if norm(side) < 1e-3
        side = cross([0; 0; 1], travel); % head-on: pass on the left
        if norm(side) < 1e-6, side = [0; 1; 0]; end
    end
    side = side / norm(side);
    n = -cos(max_ang) * travel + sin(max_ang) * side;
end
end

function u = unit(w, fallback)
nw = norm(w);
if nw < 1e-9
    u = fallback / norm(fallback);
else
    u = w / nw;
end
end

function U = braking_profile(v0, N, dt, cfg)
U = zeros(3, N);
v = v0;
for j = 1:N
    a = -v / dt;
    na = norm(a);
    if na > cfg.sched.a_b, a = a * cfg.sched.a_b / na; end
    U(:, j) = max(min(a, cfg.mpc.a_max), -cfg.mpc.a_max);
    v = v + dt * U(:, j);
end
end
