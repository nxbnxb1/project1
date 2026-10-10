function [world, cfg] = dart_scenario_normal(seed, cfg, mode)
%DART_SCENARIO_NORMAL Low-altitude flight among LARGE obstacles.
%   mode 'normal' (scenario 'SN', default) or 'hard' (scenario 'SH').
%   Everything is drawn from the seed.
%
%   Set path   1-3 straight legs over 300 m, intermediate waypoints
%              +-30 m to the side, goal +-15 m, altitude 2-3.5 m.
%   Zones      the path is cut into zones of 40-80 m; each zone is open (no
%              obstacle), sparse (1-3 objects, half of them within 2 m of
%              the path, anchors >= 10 m apart) or dense (6-12 objects
%              within +-12 m, anchors >= 4 m apart). SN: 35 % open, 40 %
%              sparse, 25 % dense; SH: all zones dense.
%   Objects    large only (no poles): tree with a low canopy (1-3 spheres
%              of radius 1.5-3 m around the flight altitude, trunk inside),
%              bush (sphere 1-2 m), building (box, half-extents 2-6 m,
%              2.5-6 m half-height), vehicle / container (box 0.9-1.2 x
%              2-6 x 0.7-1.5 m half-extents), rock (sphere 1-1.8 m).
%              Free gap >= 3.5 m between objects, >= 8 m from start / goal.
%   SH extras  fog (visibility 200 m) in odd seeds; in seeds divisible by 3
%              two vehicles cross the path at 2-4 m/s, timed to meet the UAV
%              (TEST only: the method assumes static obstacles).
if nargin < 3 || isempty(mode), mode = 'normal'; end
hard = strcmp(mode, 'hard');
rs = dart_rng_create(7000 + seed + 500 * hard);
U = @(a, b) a + (b - a) * dart_rand(rs, 1, 1);
pick = @(n) min(n, 1 + floor(n * dart_rand(rs, 1, 1)));
% ---------------------------------------------------------------- set path
nleg = pick(3);
xs = linspace(0, 300, nleg + 1);
W = zeros(3, nleg + 1);
W(:, 1) = [0; 0; U(2.0, 3.5)];
for k = 2:nleg + 1
    if k < nleg + 1, lat = U(-30, 30); else, lat = U(-15, 15); end
    W(:, k) = [xs(k); lat; U(2.0, 3.5)];
end
world.start = W(:, 1);
world.goal = W(:, end);
world.path = W;
G = dart_path_init(W);
% ------------------------------------------------------------------ zones
S = struct('c0', zeros(3, 0), 'v', zeros(3, 0), 'type', zeros(1, 0), 'dim', zeros(3, 0), ...
    'yaw', zeros(1, 0), 'obj', zeros(1, 0));
anchors = zeros(2, 0);
zone_types = {'open', 'sparse', 'dense'};
zones = '';
ncls = zeros(1, 5);
s = 20;
while s < G.L - 15
    len = U(40, 80);
    if hard
        zt = 3;
    else
        u = dart_rand(rs, 1, 1);
        zt = 1 + (u > 0.35) + (u > 0.75);
    end
    zones = [zones, zone_types{zt}(1)]; %#ok<AGROW>
    switch zt
        case 1, n = 0; spacing = 0;
        case 2, n = round(U(1, 3)); spacing = 10;
        otherwise, n = round(U(6, 12)); spacing = 4;
    end
    for k = 1:n
        for tries = 1:15
            sk = min(s + U(0, len), G.L - 10);
            [p0, tg] = dart_path_point(G, sk);
            nrm = [-tg(2); tg(1); 0];
            sgn = 1 - 2 * (dart_rand(rs, 1, 1) < 0.5);
            if zt == 2
                if dart_rand(rs, 1, 1) < 0.5, lat = sgn * U(0, 2); else, lat = sgn * U(2, 15); end
            else
                lat = U(-12, 12);
            end
            a = p0(1:2) + nrm(1:2) * lat;
            cls = 1 + sum(dart_rand(rs, 1, 1) > cumsum([0.40 0.20 0.15 0.15]));
            T = make_object(cls, a, U);
            if fits(S, T, anchors, a, spacing, world)
                T.obj(:) = max([S.obj, 0]) + 1;
                S = cat_world(S, T);
                anchors(:, end + 1) = a; %#ok<AGROW>
                ncls(cls) = ncls(cls) + 1;
                break
            end
        end
    end
    s = s + len;
end
% ------------------------------------------------- movers (SH test worlds)
nmov = 0;
if hard && mod(seed, 3) == 0
    for k = 1:2
        sk = U(40, G.L - 30);
        [pk, tg] = dart_path_point(G, sk);
        nrm = [-tg(2); tg(1); 0];
        speed = U(2, 4);
        side = 1 - 2 * (dart_rand(rs, 1, 1) < 0.5);
        t_meet = sk / max(min(cfg.ref.v_des, cfg.mpc.v_max(1)), 1);
        dim = [U(0.9, 1.2); U(2.0, 3.0); U(0.7, 1.2)];
        c0 = pk - side * nrm * speed * t_meet;
        c0(3) = dim(3);
        S.c0(:, end + 1) = c0; S.v(:, end + 1) = side * nrm * speed; S.type(end + 1) = 2;
        S.dim(:, end + 1) = dim; S.yaw(end + 1) = atan2(nrm(2), nrm(1)); S.obj(end + 1) = max([S.obj, 0]) + 1;
        nmov = nmov + 1;
    end
end
if hard && mod(seed, 2) == 1
    cfg.depth.visibility = 200;
end
world.c0 = S.c0; world.v = S.v; world.type = S.type; world.dim = S.dim;
world.yaw = S.yaw; world.obj = S.obj; world.rho = bound_radius(S);
dyn = nmov / max(max([S.obj, 0]), 1);
world.meta = struct('layout', mode, 'nleg', nleg, 'dyn_frac', dyn, ...
    'n_prim', numel(S.type), 'n_obj', max([S.obj, 0]), 'zones', zones, ...
    'n_tree', ncls(1), 'n_bush', ncls(2), 'n_building', ncls(3), 'n_vehicle', ncls(4), ...
    'n_rock', ncls(5), 'fog', hard && mod(seed, 2) == 1);
end

% =====================================================================
function T = make_object(cls, a, U)
%MAKE_OBJECT Primitives of one large object anchored at a (2x1, ground).
T = struct('c0', zeros(3, 0), 'v', zeros(3, 0), 'type', zeros(1, 0), 'dim', zeros(3, 0), ...
    'yaw', zeros(1, 0), 'obj', zeros(1, 0));
switch cls
    case 1                                           % tree with a low canopy
        Rc = U(1.5, 3.0); zc = U(2.5, 4.5); rt = U(0.2, 0.4);
        T = push(T, [a; zc / 2], 3, [rt; zc / 2; 0], 0);
        T = push(T, [a; zc], 1, [Rc; 0; 0], 0);
        for j = 1:round(U(0, 2))
            ang = U(0, 2 * pi);
            T = push(T, [a + 0.5 * Rc * [cos(ang); sin(ang)]; zc + U(-0.3, 0.5) * Rc], 1, ...
                [U(0.6, 0.9) * Rc; 0; 0], 0);
        end
    case 2                                           % bush
        r = U(1.0, 2.0);
        T = push(T, [a; 0.7 * r], 1, [r; 0; 0], 0);
    case 3                                           % building / kiosk
        h = [U(2, 6); U(2, 6); U(2.5, 6)];
        T = push(T, [a; h(3)], 2, h, U(0, pi));
    case 4                                           % vehicle / container
        h = [U(0.9, 1.2); U(2.0, 6.0); U(0.7, 1.5)];
        T = push(T, [a; h(3)], 2, h, U(0, pi));
    otherwise                                        % rock
        r = U(1.0, 1.8);
        T = push(T, [a; 0.4 * r], 1, [r; 0; 0], 0);
end
end

function T = push(T, c, typ, dim, yaw)
T.c0(:, end + 1) = c; T.v(:, end + 1) = [0; 0; 0]; T.type(end + 1) = typ;
T.dim(:, end + 1) = dim; T.yaw(end + 1) = yaw; T.obj(end + 1) = 0;
end

function S = cat_world(S, T)
f = fieldnames(S);
for i = 1:numel(f), S.(f{i}) = [S.(f{i}), T.(f{i})]; end
end

function ok = fits(S, T, anchors, a, spacing, world)
%FITS Anchors >= spacing apart, free gap >= 3.5 m to existing objects,
%   >= 8 m from start and goal.
ok = true;
if ~isempty(anchors) && spacing > 0 && min(sqrt(sum((anchors - a).^2, 1))) < spacing
    ok = false; return
end
Tw = T; Tw.rho = bound_radius(T);
D0 = dart_world_sdf(Tw, [world.start, world.goal], 0);
if min(D0(:)) < 8
    ok = false; return
end
if isempty(S.type), return, end
Sw = S; Sw.rho = bound_radius(S);
D1 = dart_world_sdf(Sw, samples(T), 0);
ok = min(D1(:)) >= 3.5;
end

function X = samples(T)
% points on the surfaces of the primitives of T
[az, el] = meshgrid(linspace(0, 2 * pi, 13), linspace(-pi / 2, pi / 2, 7));
dirs = [cos(el(:)) .* cos(az(:)), cos(el(:)) .* sin(az(:)), sin(el(:))].';
X = zeros(3, 0);
for i = 1:numel(T.type)
    c = T.c0(:, i);
    switch T.type(i)
        case 1, X = [X, c + T.dim(1, i) * dirs]; %#ok<AGROW>
        case 2
            cy = cos(T.yaw(i)); sy = sin(T.yaw(i));
            Rz = [cy -sy 0; sy cy 0; 0 0 1];
            X = [X, c + Rz * (diag(T.dim(:, i)) * sign(dirs))]; %#ok<AGROW>
        case 3
            r = T.dim(1, i); h = T.dim(2, i);
            hz = max(hypot(dirs(1, :), dirs(2, :)), 1e-9);
            X = [X, c + [r * dirs(1, :) ./ hz; r * dirs(2, :) ./ hz; h * dirs(3, :)]]; %#ok<AGROW>
    end
end
end

function r = bound_radius(S)
r = zeros(1, numel(S.type));
for i = 1:numel(S.type)
    switch S.type(i)
        case 1, r(i) = S.dim(1, i);
        case 2, r(i) = norm(S.dim(:, i));
        case 3, r(i) = norm(S.dim(1:2, i));
    end
end
end
