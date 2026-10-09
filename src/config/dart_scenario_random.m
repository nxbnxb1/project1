function [world, cfg] = dart_scenario_random(seed, cfg)
%DART_SCENARIO_RANDOM Randomised world (scenario 'SR'): everything is drawn
%   from the seed, so a batch of seeds is a sample of a broad distribution
%   of worlds rather than a few hand-made cases.
%
%   Set path    1-3 straight legs over ~50 m, lateral turns up to +-8 m,
%               altitude 1.5-3 m.
%   Layout      'uniform' (obstacles anywhere within +-9 m of the path),
%               'clusters' (2-4 dense clusters on the path), 'corridor'
%               (wall segments on both sides of the path with gaps, plus
%               obstacles inside), 'forest' (many thin poles), 'mixed';
%               lateral offsets ~ N(0, 4 m) clipped to +-9 m (obstacles
%               concentrate near the path); up to 6 placement attempts each.
%   Shapes      spheres, boxes (any yaw, thin walls to blocks, standing or
%               floating), vertical cylinders (poles / pillars from the
%               ground) and compound objects (2-3 overlapping primitives);
%               the shape mix itself is random per world.
%   Movers      (TEST worlds only - the method treats every obstacle as
%               static and is not told which worlds have movers)
%               none (40 % of the worlds) or 10-35 % of the obstacles
%               moving at 0.3-2.0 m/s, mostly across the path and timed
%               to meet the vehicle.
%   Static obstacles keep a free gap >= gap_min = 2.0 m between their
%   surfaces (so that a passage always exists for the vehicle,
%   2 (d_s + margin) < gap_min at the nominal kappa = 0.5; at kappa = 0 it is
%   2.3 m > gap_min, so some passages are closed by design) and >= 3 m from the start and the goal.
%   world.meta records the drawn layout parameters (for stratified analysis).
rs = dart_rng_create(5000 + seed);
U = @(a, b) a + (b - a) * dart_rand(rs, 1, 1);
pick = @(n) min(n, 1 + floor(n * dart_rand(rs, 1, 1)));

% ---------------------------------------------------------------- set path
nleg = pick(3);
xs = linspace(0, 50, nleg + 1);
W = zeros(3, nleg + 1);
W(:, 1) = [0; 0; 2];
for k = 2:nleg + 1
    W(:, k) = [xs(k); (k < nleg + 1) * U(-8, 8) + (k == nleg + 1) * U(-5, 5); U(1.5, 3.0)];
end
world.start = W(:, 1);
world.goal = W(:, end);
world.path = W;
G = dart_path_init(W);

% ------------------------------------------------------------ layout draw
layouts = {'uniform', 'clusters', 'corridor', 'forest', 'mixed'};
layout = layouts{pick(numel(layouts))};
pm = dart_rand(rs, 1, 4).^2; pm = pm / sum(pm);   % shape mix: sphere box cylinder compound
dyn_frac = 0;
if dart_rand(rs, 1, 1) > 0.4, dyn_frac = U(0.10, 0.35); end
gap_min = 2.0;

S = empty_world();
L = G.L;
lat0 = @() max(min(4 * dart_randn(rs, 1, 1), 9), -9);   % obstacles concentrate near the path
switch layout
    case 'uniform'
        n = round(U(15, 40));
        for k = 1:n, S = place(S, @() add_static(S, rs, G, U(4, L - 4), lat0(), pm, gap_min, world)); end
    case 'clusters'
        nc = 1 + pick(3);
        sc = linspace(10, G.L - 10, nc) + 6 * (dart_rand(rs, 1, nc) - 0.5);
        for c = 1:nc
            m = round(U(6, 12));
            lc = U(-3, 3);
            for k = 1:m
                S = place(S, @() add_static(S, rs, G, sc(c) + U(-5, 5), lc + U(-5, 5), pm, gap_min, world));
            end
        end
    case 'corridor'
        half = U(2.5, 4.5);
        s = 2;
        while s < G.L - 2
            len = U(2, 6);
            for side = [-1 1]
                if dart_rand(rs, 1, 1) < 0.75
                    S = add_wall(S, G, s + len / 2, side * (half + 0.2), len, U(1.5, 4), gap_min, world);
                end
            end
            s = s + len + U(2.2, 4.0);
        end
        n = round(U(4, 10));
        for k = 1:n, S = place(S, @() add_static(S, rs, G, U(5, L - 5), U(-half + 1, half - 1), pm, gap_min, world)); end
    case 'forest'
        n = round(U(30, 60));
        for k = 1:n
            S = place(S, @() add_prim(S, G, U(4, L - 4), lat0(), 3, [U(0.1, 0.4); U(2, 4); 0], 0, 'ground', gap_min, world));
        end
    case 'mixed'
        n = round(U(10, 25));
        for k = 1:n, S = place(S, @() add_static(S, rs, G, U(4, L - 4), lat0(), pm, gap_min, world)); end
        n = round(U(10, 25));
        for k = 1:n
            S = place(S, @() add_prim(S, G, U(4, L - 4), lat0(), 3, [U(0.1, 0.4); U(2, 4); 0], 0, 'ground', gap_min, world));
        end
end

% ---------------------------------------------------------------- movers
nobj = max([S.obj, 0]);
nd = round(dyn_frac * nobj / max(1 - dyn_frac, 0.1));
for k = 1:nd
    sk = U(8, G.L - 4);
    [pk, tg] = dart_path_point(G, sk);
    nrm = [-tg(2); tg(1); 0]; nrm = nrm / max(norm(nrm), 1e-9);
    speed = U(0.3, 2.0);
    if dart_rand(rs, 1, 1) < 0.75                 % across the path, timed
        ang = U(-pi / 6, pi / 6);
        side = 1 - 2 * (dart_rand(rs, 1, 1) < 0.5);
        dir = side * (cos(ang) * nrm + sin(ang) * tg);
    else                                          % any horizontal direction
        a = U(0, 2 * pi); dir = [cos(a); sin(a); 0];
    end
    t_meet = sk / cfg.ref.v_des;
    c_meet = pk + nrm * U(-1.5, 1.5);
    typ = pick(3);
    switch typ
        case 1, dim = [U(0.3, 0.9); 0; 0]; z = U(1.2, 2.8);
        case 2, dim = [U(0.2, 0.8); U(0.2, 0.8); U(0.3, 0.9)]; z = U(1.2, 2.8);
        otherwise, dim = [U(0.2, 0.5); U(0.8, 1.5); 0]; z = dim(2);
    end
    c0 = c_meet - dir * speed * t_meet;
    c0(3) = z;
    S = push(S, c0, dir * speed, typ, dim, U(0, pi), nobj + k);
end

world.c0 = S.c0; world.v = S.v; world.type = S.type; world.dim = S.dim;
world.yaw = S.yaw; world.obj = S.obj; world.rho = bound_radius(S);
world.meta = struct('layout', layout, 'nleg', nleg, 'shape_mix', pm, 'dyn_frac', dyn_frac, ...
    'n_prim', numel(S.type), 'n_obj', max([S.obj, 0]));
% no algorithm settings here: the method assumes static obstacles and is
% not told whether this world contains moving ones (TEST worlds only)
end

% =====================================================================
function S = place(S, f)
%PLACE Up to 6 random attempts to place one obstacle (f draws a new one).
n0 = numel(S.type);
for k = 1:6
    T = f();
    if numel(T.type) > n0
        S = T; return
    end
end
end

function S = empty_world()
S = struct('c0', zeros(3, 0), 'v', zeros(3, 0), 'type', zeros(1, 0), 'dim', zeros(3, 0), ...
    'yaw', zeros(1, 0), 'obj', zeros(1, 0));
end

function S = push(S, c, v, typ, dim, yaw, obj)
S.c0(:, end + 1) = c; S.v(:, end + 1) = v; S.type(end + 1) = typ;
S.dim(:, end + 1) = dim; S.yaw(end + 1) = yaw; S.obj(end + 1) = obj;
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

function S = add_static(S, rs, G, s, lat, pm, gap_min, world)
U = @(a, b) a + (b - a) * dart_rand(rs, 1, 1);
u = dart_rand(rs, 1, 1);
typ = 1 + sum(u > cumsum(pm(1:3)));
switch typ
    case 1
        S = add_prim(S, G, s, lat, 1, [U(0.3, 1.2); 0; 0], 0, U(0.8, 3.2), gap_min, world);
    case 2
        dim = [U(0.15, 2.0); U(0.15, 2.0); U(0.3, 2.0)];
        if dart_rand(rs, 1, 1) < 0.5, z = 'ground'; else, z = U(1.0, 3.0); end
        S = add_prim(S, G, s, lat, 2, dim, U(0, pi), z, gap_min, world);
    case 3
        S = add_prim(S, G, s, lat, 3, [U(0.1, 0.8); U(1.0, 4.0); 0], 0, 'ground', gap_min, world);
    otherwise                                       % compound: 2-3 parts
        np = 2 + (dart_rand(rs, 1, 1) < 0.5);
        T = empty_world();
        [p0, tg] = dart_path_point(G, s);
        base = p0 + [-tg(2); tg(1); 0] * lat; base(3) = U(1.0, 3.0);
        for j = 1:np
            off = [U(-0.7, 0.7); U(-0.7, 0.7); U(-0.5, 0.5)];
            if dart_rand(rs, 1, 1) < 0.5
                T = push(T, base + off, zeros(3, 1), 1, [U(0.3, 0.8); 0; 0], 0, 0);
            else
                T = push(T, base + off, zeros(3, 1), 2, [U(0.2, 0.8); U(0.2, 0.8); U(0.2, 0.8)], U(0, pi), 0);
            end
        end
        if fits(S, T, gap_min, world)
            T.obj(:) = max([S.obj, 0]) + 1;
            S = cat_world(S, T);
        end
end
end

function S = add_wall(S, G, s, lat, len, height, gap_min, world)
[p0, tg] = dart_path_point(G, s);
c = p0 + [-tg(2); tg(1); 0] * lat;
c(3) = height / 2;
T = push(empty_world(), c, zeros(3, 1), 2, [len / 2; 0.15; height / 2], atan2(tg(2), tg(1)), 0);
if fits(S, T, gap_min, world)
    T.obj(:) = max([S.obj, 0]) + 1;
    S = cat_world(S, T);
end
end

function S = add_prim(S, G, s, lat, typ, dim, yaw, z, gap_min, world)
[p0, tg] = dart_path_point(G, s);
c = p0 + [-tg(2); tg(1); 0] * lat;
if ischar(z)                                       % standing on the ground
    if typ == 3, c(3) = dim(2); else, c(3) = dim(3); end
else
    c(3) = z;
end
T = push(empty_world(), c, zeros(3, 1), typ, dim, yaw, 0);
if fits(S, T, gap_min, world)
    T.obj(:) = max([S.obj, 0]) + 1;
    S = cat_world(S, T);
end
end

function S = cat_world(S, T)
f = fieldnames(S);
for i = 1:numel(f), S.(f{i}) = [S.(f{i}), T.(f{i})]; end
end

function ok = fits(S, T, gap_min, world)
%FITS New primitives T keep gap_min to the existing ones and 3 m to start/goal.
T.rho = bound_radius(T);
Tw = dart_world_defaults(T);
D0 = dart_world_sdf(Tw, [world.start, world.goal], 0);
ok = all(D0(:) >= 3);
if ~ok || isempty(S.type), return, end
X = surface_samples(T);
Sw = S; Sw.rho = bound_radius(S);
D1 = dart_world_sdf(Sw, X, 0);
ok = min(D1(:)) >= gap_min;
end

function X = surface_samples(T)
% points on (and just inside) the surfaces of the primitives of T
X = zeros(3, 0);
[a, e] = meshgrid(linspace(0, 2 * pi, 13), linspace(-pi / 2, pi / 2, 7));
dirs = [cos(e(:)) .* cos(a(:)), cos(e(:)) .* sin(a(:)), sin(e(:))].';
for i = 1:numel(T.type)
    c = T.c0(:, i);
    switch T.type(i)
        case 1
            X = [X, c + T.dim(1, i) * dirs]; %#ok<AGROW>
        case 2                                     % grid (<= 0.4 m) on the 6 faces
            cy = cos(T.yaw(i)); sy = sin(T.yaw(i));
            Rz = [cy -sy 0; sy cy 0; 0 0 1];
            h = T.dim(:, i);
            g = arrayfun(@(e) linspace(-e, e, max(2, ceil(2 * e / 0.4) + 1)), h, 'UniformOutput', false);
            Q = zeros(3, 0);
            for ax = 1:3
                o = setdiff(1:3, ax);
                [A, B] = meshgrid(g{o(1)}, g{o(2)});
                for sgn = [-1 1]
                    F = zeros(3, numel(A));
                    F(ax, :) = sgn * h(ax); F(o(1), :) = A(:).'; F(o(2), :) = B(:).';
                    Q = [Q, F]; %#ok<AGROW>
                end
            end
            X = [X, c + Rz * Q]; %#ok<AGROW>
        case 3
            [aa, zz] = meshgrid(linspace(0, 2 * pi, 13), linspace(-1, 1, 7));
            X = [X, c + [T.dim(1, i) * cos(aa(:)).'; T.dim(1, i) * sin(aa(:)).'; T.dim(2, i) * zz(:).']]; %#ok<AGROW>
    end
end
end
