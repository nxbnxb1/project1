function [world, cfg] = dart_scenario_easy(seed, cfg)
%DART_SCENARIO_EASY Very easy everyday scenes (scenario 'SE').
%   A straight 200 m route at 2-3.5 m altitude; the scene is chosen by the
%   seed, layout = mod(seed - 1, 6) + 1, and drawn from the seed:
%     1 open field     no obstacle at all
%     2 lone tree      one tree with a low canopy standing on the route
%     3 avenue         rows of trees on both sides, canopies 2.5-3.5 m
%                      beside the route (nothing on it)
%     4 parked cars    cars parked 2.2-3 m beside the route and a van
%                      (top 2.4-3 m) standing on it
%     5 buildings      a row of 3-4 buildings (6-10 m high) with the near
%                      face 2-3.5 m beside the route
%     6 street         two rows of buildings, street 8-12 m wide, the route
%                      in the middle, a car parked at one kerb
%   Primitives as in DART_SCENARIO_NORMAL (sphere, box, vertical cylinder).
names = {'open', 'tree', 'avenue', 'cars', 'buildings', 'street'};
lay = mod(seed - 1, 6) + 1;
rs = dart_rng_create(9000 + seed);
U = @(a, b) a + (b - a) * dart_rand(rs, 1, 1);
h = U(2.0, 3.5);
world.start = [0; 0; h];
world.goal = [200; 0; h];
world.path = [world.start, world.goal];
S = empty();
switch lay
    case 1                                            % open field
    case 2                                            % lone tree on the route
        S = add(S, tree([U(90, 110); U(-1, 1)], U));
    case 3                                            % avenue
        for x = 30:10:170
            for sgn = [-1, 1]
                T = tree([0; 0], U);
                Rc = T.dim(1, 2);                     % canopy radius
                T.c0(1:2, :) = T.c0(1:2, :) + [x + U(-1, 1); sgn * (Rc + U(2.5, 3.5))];
                S = add(S, T);
            end
        end
    case 4                                            % parked cars + a van on the route
        x = 30;
        while x < 170
            S = add(S, box([x; -U(2.2, 3.0)], [U(2.0, 2.4); U(0.85, 0.95); U(0.7, 0.8)], U(-0.05, 0.05)));
            x = x + U(8, 15);
        end
        S = add(S, box([U(90, 110); U(-0.8, 0.8)], [U(2.5, 3.0); U(1.0, 1.1); U(1.2, 1.5)], U(-0.1, 0.1)));
    case 5                                            % buildings beside the route
        x = 40; sgn = 1 - 2 * (dart_rand(rs, 1, 1) < 0.5);
        for k = 1:round(U(3, 4))
            hx = U(4, 8); hy = U(4, 6);
            S = add(S, box([x + hx; sgn * (U(2.0, 3.5) + hy)], [hx; hy; U(3, 5)], 0));
            x = x + 2 * hx + U(4, 10);
        end
    otherwise                                         % street between two rows of buildings
        w2 = U(4, 6);                                 % half width of the street
        for sgn = [-1, 1]
            x = 50;
            while x < 140
                hx = U(5, 10); hy = U(4, 6);
                S = add(S, box([x + hx; sgn * (w2 + hy)], [hx; hy; U(3, 5)], 0));
                x = x + 2 * hx + U(1, 3);
            end
        end
        S = add(S, box([U(80, 120); (1 - 2 * (dart_rand(rs, 1, 1) < 0.5)) * (w2 - 1.2)], ...
            [U(2.0, 2.4); U(0.85, 0.95); U(0.7, 0.8)], 0));
end
world.c0 = S.c0; world.v = S.v; world.type = S.type; world.dim = S.dim;
world.yaw = S.yaw; world.obj = S.obj; world.rho = bound_radius(S);
world.meta = struct('layout', names{lay}, 'nleg', 1, 'dyn_frac', 0, ...
    'n_prim', numel(S.type), 'n_obj', max([S.obj, 0]), 'zones', '', 'fog', false);
end

% =====================================================================
function S = empty()
S = struct('c0', zeros(3, 0), 'v', zeros(3, 0), 'type', zeros(1, 0), 'dim', zeros(3, 0), ...
    'yaw', zeros(1, 0), 'obj', zeros(1, 0));
end

function S = add(S, T)
T.obj(:) = max([S.obj, 0]) + 1;
f = fieldnames(S);
for i = 1:numel(f), S.(f{i}) = [S.(f{i}), T.(f{i})]; end
end

function T = tree(a, U)
% trunk (vertical cylinder) + canopy (1-3 spheres) around the flight altitude
T = empty();
Rc = U(1.5, 2.5); zc = U(2.5, 4.5); rt = U(0.2, 0.4);
T = push(T, [a; zc / 2], 3, [rt; zc / 2; 0], 0);
T = push(T, [a; zc], 1, [Rc; 0; 0], 0);
for j = 1:round(U(0, 2))
    ang = U(0, 2 * pi);
    T = push(T, [a + 0.5 * Rc * [cos(ang); sin(ang)]; zc + U(-0.3, 0.5) * Rc], 1, ...
        [U(0.6, 0.9) * Rc; 0; 0], 0);
end
end

function T = box(a, h, yaw)
% box standing on the ground: half-extents h = [along x; along y; vertical]
T = push(empty(), [a; h(3)], 2, h, yaw);
end

function T = push(T, c, typ, dim, yaw)
T.c0(:, end + 1) = c; T.v(:, end + 1) = [0; 0; 0]; T.type(end + 1) = typ;
T.dim(:, end + 1) = dim; T.yaw(end + 1) = yaw; T.obj(end + 1) = 0;
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
