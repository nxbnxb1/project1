function trk = dart_tracks_init(cfg)
%DART_TRACKS_INIT Empty obstacle-track table (struct of arrays).
%   The method handles STATIC obstacles only (method §6): every track is a
%   static landmark. Its state keeps the 6-D layout [c; v] used by the
%   predictor, scheduler, MPC and CBF, with the velocity identically zero
%   (velocity prior sigma_v_static = 0); the covariance grows only by the
%   small process noise q_static. Each track stores its POSTERIOR at the
%   time of the last update t_upd; any later estimate follows in closed
%   form from DART_TRACK_PREDICT (Eq. 28).
%   Slots carry no meaning: detections are associated with tracks by
%   gating + global nearest neighbour (DART_TRACKS_PROCESS_MSG); new
%   obstacles take the first free slot.
M = cfg.trk.max_tracks;
trk.active = false(1, M);
trk.x = zeros(6, M);
trk.P = zeros(6, 6, M);
trk.t_upd = zeros(1, M);
trk.t_init = zeros(1, M);
trk.rho = zeros(1, M);
trk.n_upd = zeros(1, M);
trk.n_rej = zeros(1, M);      % consecutive gate rejections (oracle association only)
trk.n_miss = zeros(1, M);     % consecutive missed detections while expected in view
trk.n_gate_rej = 0;           % detections not associated with any track (oracle: gate rejections)
trk.n_del = 0;                % tracks deleted after missed detections
end
