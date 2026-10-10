function [world, cfg] = dart_scenario_normal(seed, cfg)
%DART_SCENARIO_NORMAL Normal low-altitude flight (scenario 'SN'): a long set
%   path with a FEW, far-apart static obstacles, as met by a cheap UAV in
%   parks and streets. Everything is drawn from the seed.
%
%   Set path   1-3 straight legs over 120 m, intermediate waypoints
%              +-15 m to the side, goal +-8 m, altitude 2-3 m.
%   Obstacles  4-10 objects, anchors >= 8 m apart, free gap >= 3 m,
%              >= 6 m from start and goal; half of them within 2 m of the
%              path (they must be avoided), the others 2-12 m to the side:
%     tree         trunk (radius 0.12-0.30 m) up to the canopy base
%                  (2.2-3.5 m) + canopy of 1-3 spheres (radius 1.2-2.5 m)
%     small tree   thin trunk + canopy sphere (0.7-1.3 m) at 1.6-2.6 m
%     lamp post    pole (radius 0.08-0.14 m, 5-8 m high) + arm + lamp head
%     overhanging  tree standing 3-5 m beside the path whose canopy
%                  (radius 2-3 m, base 2.5-3.5 m) reaches over the path
%   Background  with probability 0.5, 1-2 buildings 14-25 m beside the path.
%   All obstacles are static (the scope of the method).
rs = dart_rng_create(7000 + seed);
U = @(a, b) a + (b - a) * dart_rand(rs, 1, 1);
pick = @(n) min(n, 1 + floor(n * dart_rand(rs, 1, 1)));
% ---------------------------------------------------------------- set path
nleg = pick(3);
xs = linspace(0, 120, nleg + 1);
W = zeros(3, nleg + 1);
W(:, 1) = [0; 0; U(2.0, 3.0)];
for k = 2:nleg + 1
    if k < nleg + 1, lat = U(-15, 15); else, lat = U(-8, 8); end
    W(:, k) = [xs(k); lat; U(2.0, 3.0)];
end
world.start = W(:, 1);
world.goal = W(:, end);
world.path = W;
G = dart_path_init(W);
% -------------------------------------------------------------- obstacles
S = struct('c0', zeros(3, 0), 'v', zeros(3, 0), 'type', zeros(1, 0), 'dim', zeros(3, 0), ...
    'yaw', zeros(1, 0), 'obj', zeros(1, 0));
anchors = zeros(2, 0);
cls_names = {'tree', 'small_tree', 'lamp', 'overhang'};
cls_p = [0.40 0.15 0.30 0.15];
ncls = zeros(1, 4);
n = round(U(4, 10));
for k = 1:n
    for tries = 1:10
        cls = 1 + sum(dart_rand(rs, 1, 1) > cumsum(cls_p(1:3)));
        s = U(12, G.L - 8);
        [p0, tg] = dart_path_point(G, s);
        nrm = [-tg(2); tg(1); 0];
        sgn = 1 - 2 * (dart_rand(rs, 1, 1) < 0.5);
        if dart_rand(rs, 1, 1) < 0.5, lat = sgn * U(0, 2); else, lat = sgn * U(2, 12); end
        if cls == 4, lat = sgn * U(3, 5); end
        a = p0(1:2) + nrm(1:2) * lat;                 % anchor (trunk / pole position)
        T = make_object(cls, a, -sgn * nrm, tg, U);
        if fits(S, T, anchors, a, world)
            T.obj(:) = max([S.obj, 0]) + 1;
            S = cat_world(S, T);
            anchors(:, end + 1) = a; %#ok<AGROW>
            ncls(cls) = ncls(cls) + 1;
            break
        end
    end
end
% ------------------------------------------------------------- buildings
nb = 0;
if dart_rand(rs, 1, 1) < 0.5
    for k = 1:pick(2)
        s = U(15, G.L - 15);
        [p0, tg] = dart_path_point(G, s);
        nrm = [-tg(2); tg(1); 0];
        h = [U(4, 8); U(3, 6); U(3, 6)];
        lat = (1 - 2 * (dart_rand(rs, 1, 1) < 0.5)) * (U(14, 25) + h(2));
        c = p0 + nrm * lat; c(3) = h(3);
        T = struct('c0', c, 'v', [0; 0; 0], 'type', 2, 'dim', h, 'yaw', atan2(tg(2), tg(1)), 'obj', 0);
        if fits(S, T, zeros(2, 0), c(1:2), world)
            T.obj = max([S.obj, 0]) + 1;
            S = cat_world(S, T);
            nb = nb + 1;
        end
    end
end
world.c0 = S.c0; world.v = S.v; world.type = S.type; world.dim = S.dim;
world.yaw = S.yaw; world.obj = S.obj; world.rho = bound_radius(S);
world.meta = struct('layout', 'normal', 'nleg', nleg, 'dyn_frac', 0, ...
    'n_prim', numel(S.type), 'n_obj', max([S.obj, 0]), 'n_tree', ncls(1), 'n_small', ncls(2), ...
    'n_lamp', ncls(3), 'n_overhang', ncls(4), 'n_building', nb);
world.meta.classes = cls_names;
end

% =====================================================================
function T = make_object(cls, a, toward, tg, U)
%MAKE_OBJECT Primitives of one object anchored at a (2x1, ground position).
%   toward: horizontal unit vector pointing to the path (overhang, lamp arm)
T = struct('c0', zeros(3, 0), 'v', zeros(3, 0), 'type', zeros(1, 0), 'dim', zeros(3, 0), ...
    'yaw', zeros(1, 0), 'obj', zeros(1, 0));
switch cls
    case 1                                           % tree
        hb = U(2.2, 3.5); rt = U(0.12, 0.30);
        T = push(T, [a; (hb + 0.6) / 2], 3, [rt; (hb + 0.6) / 2; 0], 0);
        Rc = U(1.2, 2.5);
        T = push(T, [a; hb + 0.85 * Rc], 1, [Rc; 0; 0], 0);
        for j = 1:round(U(0, 2))
            ang = U(0, 2 * pi);
            off = 0.5 * Rc * [cos(ang); sin(ang)];
            T = push(T, [a + off; hb + 0.85 * Rc + U(-0.3, 0.3) * Rc], 1, [U(0.7, 1.0) * Rc; 0; 0], 0);
        end
    case 2                                           % small tree / bush
        Rc = U(0.7, 1.3); zc = U(1.6, 2.6);
        T = push(T, [a; (zc - 0.5 * Rc) / 2], 3, [U(0.06, 0.12); (zc - 0.5 * Rc) / 2; 0], 0);
        T = push(T, [a; zc], 1, [Rc; 0; 0], 0);
    case 3                                           % lamp post
        H = U(5, 8); r = U(0.08, 0.14); la = U(0.6, 1.0);
        T = push(T, [a; H / 2], 3, [r; H / 2; 0], 0);
        d = toward(1:2) / max(norm(toward(1:2)), 1e-9);
        yaw = atan2(d(2), d(1));
        T = push(T, [a + d * la; H - 0.1], 2, [la; 0.04; 0.04], yaw);
        T = push(T, [a + d * 2 * la; H - 0.2], 2, [0.25; 0.12; 0.06], yaw);
    case 4                                           % tree overhanging the path
        hb = U(2.5, 3.5); rt = U(0.15, 0.35); Rc = U(2.0, 3.0);
        T = push(T, [a; (hb + 0.6) / 2], 3, [rt; (hb + 0.6) / 2; 0], 0);
        d = toward(1:2) / max(norm(toward(1:2)), 1e-9);
        T = push(T, [a + d * 0.6 * Rc; hb + 0.85 * Rc], 1, [Rc; 0; 0], 0);
        T = push(T, [a + d * 0.1 * Rc; hb + 1.0 * Rc], 1, [0.8 * Rc; 0; 0], 0);
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

function ok = fits(S, T, anchors, a, world)
%FITS Anchors >= 8 m apart, free gap >= 3 m to existing objects, >= 6 m
%   from start and goal.
ok = true;
if ~isempty(anchors) && min(sqrt(sum((anchors - a).^2, 1))) < 8
    ok = false; return
end
Tw = T; Tw.rho = bound_radius(T);
D0 = dart_world_sdf(Tw, [world.start, world.goal], 0);
if min(D0(:)) < 6
    ok = false; return
end
if isempty(S.type), return, end
Sw = S; Sw.rho = bound_radius(S);
X = samples(T);
D1 = dart_world_sdf(Sw, X, 0);
ok = min(D1(:)) >= 3;
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
        case 2, X = [X, c + diag(T.dim(:, i)) * sign(dirs)]; %#ok<AGROW>
        case 3
            r = T.dim(1, i); h = T.dim(2, i);
            X = [X, c + [r * dirs(1, :) ./ max(hypot(dirs(1, :), dirs(2, :)), 1e-9); ...
                r * dirs(2, :) ./ max(hypot(dirs(1, :), dirs(2, :)), 1e-9); h * dirs(3, :)]]; %#ok<AGROW>
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
