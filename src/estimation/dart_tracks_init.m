function trk = dart_tracks_init(cfg)
%DART_TRACKS_INIT Empty obstacle-track table (struct of arrays).
%   Slot k holds the obstacle with instance id k (association by the
%   segmentation instance id, assumption A6). Each track stores its
%   POSTERIOR at the time of its last update t_upd; any later estimate is
%   obtained in closed form by DART_TRACK_PREDICT (Eq. 28).
M = cfg.trk.max_tracks;
trk.active = false(1, M);
trk.x = zeros(6, M);
trk.P = zeros(6, 6, M);
trk.t_upd = zeros(1, M);
trk.rho = zeros(1, M);
trk.n_upd = zeros(1, M);
trk.n_rej = zeros(1, M);
trk.n_gate_rej = 0;
end
