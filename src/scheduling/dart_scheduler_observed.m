function ss = dart_scheduler_observed(ss, o, R_IC, grid, cfg)
%DART_SCHEDULER_OBSERVED Register the free space observed by one frame whose
%   result has arrived: camera centre o and orientation R_IC at the capture
%   time, and its coarse depth grid (DART_DEPTH_GRID). The space seen
%   through a cell is free up to min(cell depth, R_eff); the 3 x 3 minimum
%   over neighbouring cells is stored so that a tube around the path, not
%   only its centre line, has to be free. The last sched.cov_frames frames
%   are kept.
R_eff = dart_perception_range(cfg);
F = min(grid, R_eff);
[gh, gw] = size(F);
P = inf(gh + 2, gw + 2);
P(2:gh + 1, 2:gw + 1) = F;
M = F;
for dr = 0:2
    for dc = 0:2
        M = min(M, P(1 + dr:gh + dr, 1 + dc:gw + dc));
    end
end
ss.cov_o = [ss.cov_o, o];
ss.cov_R = cat(3, ss.cov_R, R_IC);
ss.cov_G = cat(3, ss.cov_G, M);
K = cfg.sched.cov_frames;
if size(ss.cov_o, 2) > K
    ss.cov_o = ss.cov_o(:, end - K + 1:end);
    ss.cov_R = ss.cov_R(:, :, end - K + 1:end);
    ss.cov_G = ss.cov_G(:, :, end - K + 1:end);
end
end
