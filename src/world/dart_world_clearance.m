function [clr, idx] = dart_world_clearance(world, p, t, r_body)
%DART_WORLD_CLEARANCE True distance between the vehicle hull and the
%   closest obstacle surface (negative = collision).
c = world.c0 + world.v * t;
d = sqrt(sum((c - p).^2, 1)) - world.rho - r_body;
[clr, idx] = min(d);
if isempty(clr), clr = inf; idx = 0; end
end
