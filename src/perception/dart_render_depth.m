function [depth, inst] = dart_render_depth(cam, p, R_IB, cfg, centers, radii)
%DART_RENDER_DEPTH Ray-cast a z-depth image of a set of spheres (Eq. 7).
%   p, R_IB    true vehicle position and attitude at capture time
%   centers    3 x M sphere centres, radii 1 x M
%   depth      1 x (W*H) optical-axis depth (Inf where nothing is hit)
%   inst       1 x (W*H) index of the visible sphere (0 = background)
R_IC = R_IB * cfg.cam.R_BC;
o = p + R_IB * cfg.cam.p_BC;
d = R_IC * cam.dirC;                       % 3 x P unit rays in the inertial frame
P = size(d, 2);
range = inf(1, P);
inst = zeros(1, P);
for i = 1:size(centers, 2)
    oc = centers(:, i) - o;
    dist = norm(oc);
    if dist - radii(i) > cfg.cam.R_max / min(cam.cosz) + 1
        continue                            % cannot be within range
    end
    b = oc.' * d;                           % projection of centre on each ray
    disc = b.^2 - (dist^2 - radii(i)^2);
    hit = disc >= 0;
    if ~any(hit), continue, end
    t = b(hit) - sqrt(disc(hit));
    idx = find(hit);
    ok = t > 0;
    idx = idx(ok); t = t(ok);
    closer = t < range(idx);
    range(idx(closer)) = t(closer);
    inst(idx(closer)) = i;
end
depth = range .* cam.cosz;
far = depth > cfg.cam.R_max;
depth(far) = inf;
inst(far) = 0;
end
