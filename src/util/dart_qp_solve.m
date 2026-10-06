function [z, info] = dart_qp_solve(H, f, A, b, z0, opts)
%DART_QP_SOLVE Dense convex QP
%       min 1/2 z'Hz + f'z   s.t.  A z <= b,  lb <= z <= ub (opts.lb/opts.ub)
%   Primal-dual interior-point method with Mehrotra predictor-corrector and
%   an infeasible start, so z0 does not need to be feasible. Simple bounds
%   are handled natively (diagonal contribution to the Newton system).
%   Pure MATLAB, no toolbox required (also runs in GNU Octave).
%
%   info.status  0 converged, 1 max iterations (best iterate returned)
%   info.iter    iterations
%   info.res     [primal dual mu] residual norms at exit

if nargin < 5 || isempty(z0), z0 = zeros(numel(f), 1); end
if nargin < 6, opts = struct(); end
tol     = getopt(opts, 'tol', 1e-7);
maxIter = getopt(opts, 'maxIter', 60);
reg     = getopt(opts, 'reg', 1e-10);
n = numel(f);
lb = getopt(opts, 'lb', -inf(n, 1)); lb = lb(:);
ub = getopt(opts, 'ub', inf(n, 1));  ub = ub(:);

H = 0.5 * (H + H.') + reg * eye(n);
z = z0(:);
iu = find(isfinite(ub));
il = find(isfinite(lb));
mg = numel(b); mu_ = numel(iu); ml = numel(il);
m = mg + mu_ + ml;
bb = [b(:); ub(iu); -lb(il)];

if m == 0
    z = -H \ f;
    info = struct('status', 0, 'iter', 0, 'res', [0 0 0], 'lambda', []);
    return
end

Aop  = @(x) [A * x; x(iu); -x(il)];
ATop = @(y) A.' * y(1:mg) + scatter(iu, y(mg + 1:mg + mu_), n) - scatter(il, y(mg + mu_ + 1:end), n);

s = max(bb - Aop(z), 1);          % well-centred start for the slacks
lam = ones(m, 1);
nrm_b = 1 + norm(bb, inf);
nrm_f = 1 + norm(f, inf);
status = 1;
it = 0;
for it = 1:maxIter
    rd = H * z + f + ATop(lam);
    rp = Aop(z) + s - bb;
    mu = (s.' * lam) / m;
    if norm(rp, inf) <= tol * nrm_b && norm(rd, inf) <= tol * nrm_f && mu <= tol
        status = 0;
        break
    end
    D = min(lam ./ s, 1e12);                % cap: avoids overflow near convergence
    Dg = D(1:mg);
    dg = scatter(iu, D(mg + 1:mg + mu_), n) + scatter(il, D(mg + mu_ + 1:end), n);
    M = H + A.' * (A .* Dg) + diag(dg);
    M = 0.5 * (M + M.');
    [L, p] = chol(M, 'lower');
    dreg = 1e-10 * max(1, max(diag(M)));
    while p ~= 0 && dreg < 1e3
        [L, p] = chol(M + dreg * eye(n), 'lower');
        dreg = dreg * 100;
    end
    if p ~= 0, L = []; end

    % --- predictor (affine scaling)
    rc = s .* lam;
    [dz, dl, ds] = newton(M, L, Aop, ATop, D, rd, rp, rc, s, lam);
    a_aff = step_len(s, ds, lam, dl);
    mu_aff = ((s + a_aff * ds).' * (lam + a_aff * dl)) / m;
    sigma = (mu_aff / max(mu, 1e-300))^3;

    % --- corrector
    rc = s .* lam + ds .* dl - sigma * mu;
    [dz, dl, ds] = newton(M, L, Aop, ATop, D, rd, rp, rc, s, lam);
    a = min(1, 0.99 * step_len(s, ds, lam, dl));
    z = z + a * dz;
    s = s + a * ds;
    lam = lam + a * dl;
end
rd = H * z + f + ATop(lam);
rp = Aop(z) + s - bb;
info = struct('status', status, 'iter', it, ...
    'res', [norm(rp, inf), norm(rd, inf), (s.' * lam) / m], 'lambda', lam(1:mg));
end

function [dz, dl, ds] = newton(M, L, Aop, ATop, D, rd, rp, rc, s, lam)
rhs = -rd - ATop(D .* rp - rc ./ s);
if isempty(L)
    dz = M \ rhs;
else
    dz = L.' \ (L \ rhs);
end
dl = D .* (Aop(dz) + rp) - rc ./ s;
ds = -(rc + s .* dl) ./ lam;
end

function a = step_len(s, ds, lam, dl)
a = 1;
k = ds < 0;
if any(k), a = min(a, min(-s(k) ./ ds(k))); end
k = dl < 0;
if any(k), a = min(a, min(-lam(k) ./ dl(k))); end
end

function v = scatter(idx, val, n)
v = zeros(n, 1);
v(idx) = val;
end

function v = getopt(o, name, def)
if isfield(o, name), v = o.(name); else, v = def; end
end
