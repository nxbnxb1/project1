function [world, cfg] = dart_scenario(name, seed, cfg)
%DART_SCENARIO Random obstacle field for a named scenario.
%   [world, cfg] = DART_SCENARIO(name, seed, cfg) returns the ground-truth
%   world and a cfg adapted to the scenario.
%
%   S1  static "forest": three clusters of spheres along a 50 m corridor,
%       separated by open space (clutter is intermittent)
%   S2  sparse static field + obstacles crossing the corridor (a TEST world
%       with movers; the method itself assumes static obstacles)
%   S3  S1 geometry with slow, noisy perception (latency stress test)
%   SR  randomised world: random set path, layout, shapes (spheres,
%       boxes, poles, compound objects), movers in 60 % of the worlds
%       (DART_SCENARIO_RANDOM; test worlds - the method assumes static obstacles)
%
%   world.c0   3xM initial centres       world.v  3xM constant velocities
%   world.rho  1xM radii                 world.start, world.goal  3x1
%   world.path 3xK waypoints of the set path (reference trajectory)
%   world.type/dim/yaw/obj  primitive shapes (DART_WORLD_DEFAULTS); SR
%   worlds also carry world.meta (layout parameters)

if nargin < 3 || isempty(cfg), cfg = dart_default_config(); end
cfg.scenario = name;
cfg.sim.seed = seed;
rs = dart_rng_create(1000 + seed);

world.start = [0; 0; 2.0];
world.goal  = [50; 0; 2.0];
world.path  = [world.start, world.goal];   % set path (waypoints), straight by default

switch upper(name)
    case {'S1', 'S3'}
        [c1, r1] = place_spheres(rs, 10, [7 15], [-6 6], [1.2 2.8], [0.35 0.9], world);
        [c2, r2] = place_spheres(rs, 10, [24 32], [-6 6], [1.2 2.8], [0.35 0.9], world);
        [c3, r3] = place_spheres(rs, 8, [39 45], [-6 6], [1.2 2.8], [0.35 0.9], world);
        c0 = [c1, c2, c3]; rho = [r1, r2, r3];
        v = zeros(3, size(c0, 2));
        if strcmpi(name, 'S3')
            cfg.lat.inf_mean = 0.16;
            cfg.lat.inf_max  = 0.40;
            cfg.depth.sigma_scale = 0.07;
        end
    case 'S2'
        [c0, rho] = place_spheres(rs, 14, [6 44], [-7 7], [1.2 2.8], [0.35 0.9], world);
        v = zeros(3, size(c0, 2));
        % crossing obstacles: timed so that they intersect the corridor while
        % the vehicle passes (cruise ~ v_des)
        nd = 6;
        cd = zeros(3, nd); vd = zeros(3, nd); rd = zeros(1, nd);
        for k = 1:nd
            xk = 10 + (k - 1) * 6 + 2 * dart_rand(rs, 1, 1);
            speed = 0.6 + 0.9 * dart_rand(rs, 1, 1);
            side = sign(dart_rand(rs, 1, 1) - 0.5); if side == 0, side = 1; end
            t_cross = xk / cfg.ref.v_des;               % when the UAV is at xk
            y_cross = 1.5 * (dart_rand(rs, 1, 1) - 0.5); % near the straight line
            cd(:, k) = [xk; y_cross - side * speed * t_cross; 1.6 + 0.8 * dart_rand(rs, 1, 1)];
            vd(:, k) = [0; side * speed; 0];
            rd(k) = 0.4 + 0.3 * dart_rand(rs, 1, 1);
        end
        c0 = [c0, cd]; v = [v, vd]; rho = [rho, rd];
        % no algorithm settings here: the method assumes static obstacles
        % and is not told that this world contains moving ones
    case 'SR'
        [world, cfg] = dart_scenario_random(seed, cfg);
        world.name = 'SR';
        world.seed = seed;
        world = dart_world_defaults(world);
        return
    otherwise
        error('dart:scenario', 'Unknown scenario %s', name);
end

world.c0  = c0;
world.v   = v;
world.rho = rho;
world.name = upper(name);
world.seed = seed;
world = dart_world_defaults(world);
end

function [c, r] = place_spheres(rs, n, xr, yr, zr, rr, world)
c = zeros(3, 0); r = zeros(1, 0);
tries = 0;
while size(c, 2) < n && tries < 5000
    tries = tries + 1;
    ck = [xr(1) + diff(xr) * dart_rand(rs, 1, 1);
          yr(1) + diff(yr) * dart_rand(rs, 1, 1);
          zr(1) + diff(zr) * dart_rand(rs, 1, 1)];
    rk = rr(1) + diff(rr) * dart_rand(rs, 1, 1);
    if norm(ck - world.start) < rk + 3 || norm(ck - world.goal) < rk + 3
        continue
    end
    ok = true;
    for j = 1:size(c, 2)
        % keep a passage of at least 2.0 m between neighbouring surfaces:
        % 2 x (d_s + inflation) must fit for the forest to stay traversable
        if norm(ck - c(:, j)) < rk + r(j) + 2.0
            ok = false; break
        end
    end
    if ok
        c(:, end + 1) = ck; %#ok<AGROW>
        r(end + 1) = rk;    %#ok<AGROW>
    end
end
end
