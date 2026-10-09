function D = dart_world_sdf(world, P, t)
%DART_WORLD_SDF Signed distance from points P (3 x n) to every primitive
%   of the world at time t (M x n; negative inside).
M = size(world.c0, 2);
n = size(P, 2);
D = inf(M, n);
C = world.c0 + world.v * t;
for i = 1:M
    q = P - C(:, i);
    switch world.type(i)
        case 1                                   % sphere
            D(i, :) = sqrt(sum(q.^2, 1)) - world.dim(1, i);
        case 2                                   % box, yaw about z
            cy = cos(world.yaw(i)); sy = sin(world.yaw(i));
            ql = [cy * q(1, :) + sy * q(2, :); -sy * q(1, :) + cy * q(2, :); q(3, :)];
            e = abs(ql) - world.dim(:, i);
            D(i, :) = sqrt(sum(max(e, 0).^2, 1)) + min(max(e, [], 1), 0);
        case 3                                   % vertical cylinder
            e = [sqrt(q(1, :).^2 + q(2, :).^2) - world.dim(1, i); abs(q(3, :)) - world.dim(2, i)];
            D(i, :) = sqrt(sum(max(e, 0).^2, 1)) + min(max(e, [], 1), 0);
    end
end
end
