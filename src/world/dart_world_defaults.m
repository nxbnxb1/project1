function world = dart_world_defaults(world)
%DART_WORLD_DEFAULTS Fill the shape fields of a world made of spheres only.
%   world.type  1 x M  1 = sphere, 2 = box (yaw-rotated), 3 = vertical cylinder
%   world.dim   3 x M  sphere [r 0 0]; box half-extents [a b c] (body
%                      x, y, z); cylinder [r h/2 0]
%   world.yaw   1 x M  box yaw [rad]
%   world.obj   1 x M  object id (several primitives of one compound
%                      object share it; it is the ground-truth label)
%   world.rho   1 x M  radius of the bounding sphere (culling, scoring)
M = size(world.c0, 2);
if ~isfield(world, 'type'), world.type = ones(1, M); end
if ~isfield(world, 'dim'), world.dim = [world.rho; zeros(2, M)]; end
if ~isfield(world, 'yaw'), world.yaw = zeros(1, M); end
if ~isfield(world, 'obj'), world.obj = 1:M; end
end
