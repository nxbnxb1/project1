function dart_export_run(res, file)
%DART_EXPORT_RUN Write one run as JSON for plotting outside MATLAB
%   (docs/figures/plot_stuck.py): world primitives and set path, the flown
%   trajectory (10 Hz), the perception trigger times, progress along the
%   set path, and the controller snapshots res.snaps (cfg.sim.snap_dt > 0).
L = res.log; w = dart_world_defaults(res.world); nm = dart_diag_names();
cfg = res.cfg;
k = 1:10:numel(L.t);
if k(end) ~= numel(L.t), k(end + 1) = numel(L.t); end
psi = zeros(1, numel(k));
for i = 1:numel(k)
    R = dart_quat2rotm(L.x(7:10, k(i)));
    psi(i) = atan2(R(2, 1), R(1, 1));
end
out = struct();
out.variant = cfg.variant;
out.scenario = w.name;
out.seed = w.seed;
out.outcome = res.outcome;
out.v_des = cfg.ref.v_des;
out.cam = struct('hfov', cfg.cam.hfov, 'R_eff', dart_perception_range(cfg), 'd_s', cfg.sched.d_s);
out.world = struct('type', w.type, 'c0', w.c0, 'v', w.v, 'dim', w.dim, 'yaw', w.yaw, 'obj', w.obj, ...
    'path', w.path, 'start', w.start, 'goal', w.goal);
out.log = struct('t', L.t(k), 'p', L.x(1:3, k), 'speed', sqrt(sum(L.x(4:6, k).^2, 1)), 'psi', psi, ...
    's_prog', L.dg(strcmp(nm, 's_prog'), k), 'clear', L.clear(k));
out.trig_t = L.t(L.trig > 0.5);
out.snaps = res.snaps;
fid = fopen(file, 'w');
fprintf(fid, '%s', jsonencode(out));
fclose(fid);
end
