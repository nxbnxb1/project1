function [R_eff, R_det] = dart_perception_range(cfg)
%DART_PERCEPTION_RANGE Range within which the smallest obstacle the mission
%   must avoid (radius cfg.sched.r_min) is reliably detected.
%   R_det  detection range (>= 90 % of frames) of an obstacle of radius
%          r_min, interpolated in cfg.cam.det_table = [radius, range] rows,
%          measured for the configured camera + depth network +
%          segmentation by DART_EVAL_DETECTION_RANGE (a thin pole is
%          diluted by the network blur and is seen only when close)
%   R_eff  R_det / cfg.sched.range_bias: the network reads thin far objects
%          too far (90th percentile of estimated / true surface distance),
%          so an obstacle READ at R_det may be as close as R_eff
tb = cfg.cam.det_table;
r = min(max(cfg.sched.r_min, tb(1, 1)), tb(end, 1));
R_det = interp1(tb(:, 1), tb(:, 2), r, 'linear');
R_det = min(R_det, cfg.cam.R_max);
R_eff = R_det / cfg.sched.range_bias;
end
