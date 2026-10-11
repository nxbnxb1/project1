function obl = dart_obstacles_local(ob, p)
%DART_OBSTACLES_LOCAL Locally equivalent spheres of the cylinder obstacles.
%   For the vehicle position p every vertical cylinder (ob.c axis point,
%   ob.rho, ob.zl, ob.zh; DART_CYL_DIST) is replaced by the sphere of the
%   same radius rho centred at c_eff = q - rho n, with q the closest
%   surface point and n the outward normal there: |p - c_eff| - rho equals
%   the distance to the cylinder and (p - c_eff) / |p - c_eff| its
%   gradient. The safety layer (CBF), the risk terms and the scheduler are
%   first-order conditions at p, so they hold for the cylinder exactly when
%   written with these spheres. obl.cax keeps the axis points.
obl = ob;
obl.cax = ob.c;
for k = 1:numel(ob.rho)
    [~, n, q] = dart_cyl_dist(p, ob.c(:, k), ob.rho(k), ob.zl(k), ob.zh(k));
    obl.c(:, k) = q - ob.rho(k) * n;
end
end
