function rk = dart_risk_terms(ob, p, v, cfg)
%DART_RISK_TERMS Per-obstacle geometric risk quantities (method §7).
%   ob are the obstacles as locally equivalent spheres at p
%   (DART_OBSTACLES_LOCAL: |p - c| - rho is the distance to the vertical
%   cylinder), so the quantities below are those of the cylinders.
%   rk.d      centre distance            rk.dc    conservative surface distance (Eq. 35)
%   rk.vc     closing speed (Eq. 34)     rk.vcb   conservative closing speed
%   rk.sig_r  sqrt(lambda_max(P_r))      rk.sig_v sqrt(lambda_max(P_v))
%   rk.miss   miss distance: the smallest distance between the obstacle's
%             SURFACE and the ray from p along the current velocity, up to
%             cam.R_max ahead (Inf if the obstacle is behind or v ~ 0); the
%             obstacle is on a collision course if rk.miss < d_s + beta_d
%             sig_r (+ a margin; DART_SCHEDULER emergency, DART_CLUTTER_SPEED)
M = numel(ob.id);
rk.d = zeros(1, M); rk.dc = zeros(1, M); rk.vc = zeros(1, M); rk.vcb = zeros(1, M);
rk.sig_r = zeros(1, M); rk.sig_v = zeros(1, M); rk.miss = inf(1, M);
sv = norm(v);
Pq = cfg.est.sigma_p^2 * eye(3);
cyl = isfield(ob, 'cax') && isfield(ob, 'zl');
if sv > 0.1
    s = 0:0.5:cfg.cam.R_max;
    Ray = p + (v / sv) * s;                    % samples of the ray ahead
end
for k = 1:M
    r = ob.c(:, k) - p;
    vr = ob.v(:, k) - v;
    d = norm(r);
    rk.d(k) = d;
    rk.sig_r(k) = sqrt(dart_lmax_sym3(ob.P(1:3, 1:3, k) + Pq));
    rk.sig_v(k) = sqrt(dart_lmax_sym3(ob.P(4:6, 4:6, k)));
    rk.vc(k) = max(0, -(r.' * vr) / (d + 1e-6));
    rk.vcb(k) = rk.vc(k) + cfg.sched.beta_v * rk.sig_v(k);
    rk.dc(k) = d - ob.rho(k) - cfg.sched.beta_d * rk.sig_r(k);
    if sv > 0.1 && r.' * v > 0
        if cyl
            rk.miss(k) = min(dart_cyl_dist(Ray, ob.cax(:, k), ob.rho(k), ob.zl(k), ob.zh(k)));
        else                                   % plain spheres
            rk.miss(k) = norm(r - (r.' * v / sv^2) * v) - ob.rho(k);
        end
    end
end
end
