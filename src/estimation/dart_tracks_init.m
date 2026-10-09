function trk = dart_tracks_init(cfg)
%DART_TRACKS_INIT Empty obstacle-track table (struct of arrays).
%   Slots carry no meaning: detections are associated with tracks by
%   gating + global nearest neighbour (DART_TRACKS_PROCESS_MSG); new
%   obstacles take the first free slot. Each track runs two filters
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
trk.n_rej = zeros(1, M);      % consecutive gate rejections (oracle association only)
trk.n_miss = zeros(1, M);     % consecutive missed detections while expected in view
trk.n_gate_rej = 0;           % detections not associated with any track (oracle: gate rejections)
trk.n_del = 0;                % tracks deleted after missed detections
end
