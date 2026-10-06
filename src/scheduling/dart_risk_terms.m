function rk = dart_risk_terms(ob, p, v, cfg)
%DART_RISK_TERMS Per-obstacle geometric risk quantities (Sec. 6.1-6.2).
%   rk.d      centre distance            rk.dc    conservative surface distance (Eq. 35)
%   rk.vc     closing speed (Eq. 34)     rk.vcb   conservative closing speed
%   rk.sig_r  sqrt(lambda_max(P_r))      rk.sig_v sqrt(lambda_max(P_v))
M = numel(ob.id);
rk.d = zeros(1, M); rk.dc = zeros(1, M); rk.vc = zeros(1, M); rk.vcb = zeros(1, M);
rk.sig_r = zeros(1, M); rk.sig_v = zeros(1, M);
Pq = cfg.est.sigma_p^2 * eye(3);
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
end
end
