function [depth, inst] = dart_render_world(cam, p, R_IB, cfg, world, t)
%DART_RENDER_WORLD Ray-cast a z-depth image of the world's primitives
%   (spheres, yaw-rotated boxes, vertical cylinders) at time t (Eq. 7).
%   depth  1 x (W*H) optical-axis depth (Inf where nothing is hit or
%          beyond cam.d_far, default cfg.cam.R_max)
%   inst   1 x (W*H) object id of the visible surface (0 = background);
%          ground truth, used only for scoring and the oracle ablation
R_IC = R_IB * cfg.cam.R_BC;
o = p + R_IB * cfg.cam.p_BC;
d = R_IC * cam.dirC;                       % 3 x P unit rays (inertial)
P = size(d, 2);
range = inf(1, P);
inst = zeros(1, P);
C = world.c0 + world.v * t;
d_far = cfg.cam.R_max;
if isfield(cam, 'd_far'), d_far = cam.d_far; end    % supersampled render: beyond R_max
rmax = d_far / min(cam.cosz) + 1;
for i = 1:size(C, 2)
    oc = C(:, i) - o;
    if norm(oc) - world.rho(i) > rmax, continue, end
    % cull with the bounding sphere first
    b = oc.' * d;
    hitb = b.^2 - (oc.' * oc - world.rho(i)^2) >= 0 & b > -world.rho(i);
    if ~any(hitb), continue, end
    idx = find(hitb);
    dd = d(:, idx);
    switch world.type(i)
        case 1
            r = world.dim(1, i);
            bb = b(idx);
            disc = bb.^2 - (oc.' * oc - r^2);
            ok = disc >= 0;
            tt = inf(1, numel(idx));
            tt(ok) = bb(ok) - sqrt(disc(ok));
        case 2
            cy = cos(world.yaw(i)); sy = sin(world.yaw(i));
            Rl = [cy sy 0; -sy cy 0; 0 0 1];
            ol = Rl * (o - C(:, i));
            dl = Rl * dd;
            h = world.dim(:, i);
            dl(abs(dl) < 1e-12) = 1e-12;
            t1 = (-h - ol) ./ dl; t2 = (h - ol) ./ dl;
            tmin = max(min(t1, t2), [], 1);
            tmax = min(max(t1, t2), [], 1);
            tt = inf(1, numel(idx));
            ok = tmax >= max(tmin, 0) & tmin > 0;
            tt(ok) = tmin(ok);
        case 3
            r = world.dim(1, i); hz = world.dim(2, i);
            ol = o - C(:, i);
            a = dd(1, :).^2 + dd(2, :).^2;
            bq = ol(1) * dd(1, :) + ol(2) * dd(2, :);
            cq = ol(1)^2 + ol(2)^2 - r^2;
            disc = bq.^2 - a .* cq;
            tt = inf(1, numel(idx));
            ok = disc >= 0 & a > 1e-12;
            ts = (-bq - sqrt(max(disc, 0))) ./ max(a, 1e-12);
            zs = ol(3) + ts .* dd(3, :);
            side = ok & ts > 0 & abs(zs) <= hz;
            tt(side) = ts(side);
            for sgn = [-1 1]                              % caps
                tc = (sgn * hz - ol(3)) ./ dd(3, :);
                xc = ol(1) + tc .* dd(1, :); yc = ol(2) + tc .* dd(2, :);
                cap = tc > 0 & xc.^2 + yc.^2 <= r^2 & tc < tt;
                tt(cap) = tc(cap);
            end
    end
    closer = tt < range(idx);
    range(idx(closer)) = tt(closer);
    inst(idx(closer)) = world.obj(i);
end
depth = range .* cam.cosz;
far = depth > d_far;
depth(far) = inf;
inst(far) = 0;
end
