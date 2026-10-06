function trk = dart_tracks_init(cfg)
%DART_TRACKS_INIT Empty obstacle-track table (struct of arrays).
%   Slot k holds the obstacle with instance id k (association by the
%   segmentation instance id, assumption A6). Each track runs two filters
%   on the same measurements (Sec. 5.3): a constant-velocity filter (x, P)
%   and a stationary filter (xs, Ps) with a tight velocity prior and almost
%   no process noise. Both store their POSTERIOR at the time of the last
%   update t_upd; any later estimate is obtained in closed form by
%   DART_TRACK_PREDICT (Eq. 28) from the selected model (static flag).
M = cfg.trk.max_tracks;
trk.active = false(1, M);
trk.x = zeros(6, M);
trk.P = zeros(6, 6, M);
trk.xs = zeros(6, M);
trk.Ps = zeros(6, 6, M);
trk.static = false(1, M);
trk.mu = zeros(1, M);
trk.t_upd = zeros(1, M);
trk.t_init = zeros(1, M);
trk.rho = zeros(1, M);
trk.n_upd = zeros(1, M);
trk.n_rej = zeros(1, M);
trk.n_gate_rej = 0;
end
