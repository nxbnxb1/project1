function trk = dart_tracks_prune(trk, t, p, R_IB, cfg)
%DART_TRACKS_PRUNE Forget tracks that have left the field of view (method §6).
%   To keep the computation minimal there is no obstacle memory by
%   default: a track is forgotten as soon as its sphere is entirely out of
%   view (cfg.trk.forget_dist = 0). With forget_dist > 0 a track out of
%   view is kept while it is closer than forget_dist (a local memory, at
%   the cost of predicting, risk-checking and constraining more tracks).
%   Without memory, sideways or backward motion into space that is out of
%   view is protected only by the blind-motion rows of the CBF filter
%   (speed limits beyond the field of view, method §9.3).
%   (A track of an obstacle that has moved away is removed in view, after
%   missed detections, by DART_TRACKS_PROCESS_MSG.)
ids = find(trk.active);
for k = 1:numel(ids)
    i = ids(k);
    x = dart_track_predict(trk, i, t, cfg);
    c = x(1:3);
    d = max(norm(c - p), 1e-6);
    % still (partly) visible: centre inside the frustum enlarged by the
    % sphere's angular radius
    if dart_in_fov(c, p, R_IB, cfg, -asin(min(trk.rho(i) / d, 0.99)))
        continue
    end
    if d - trk.rho(i) > cfg.trk.forget_dist
        trk.active(i) = false;
    end
end
end
