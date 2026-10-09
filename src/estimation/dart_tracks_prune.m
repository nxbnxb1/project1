function trk = dart_tracks_prune(trk, t, p, R_IB, cfg)
%DART_TRACKS_PRUNE Forget tracks that are out of view and far (method §6).
%   Tracks are static landmarks and form a local obstacle memory: a track
%   whose sphere is entirely out of view is kept while it is closer than
%   cfg.trk.forget_dist (default 10 m) and forgotten beyond. Keeping a
%   track costs a few hundred operations per control tick, orders of
%   magnitude less than one depth inference. With forget_dist = 0 (no
%   memory, variant MEM0) an obstacle that left the view during a turn is
%   unknown until the next inference when it comes back into view, and
%   sideways or backward motion is protected only by the blind-motion rows
%   of the CBF filter - this caused collisions.
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
