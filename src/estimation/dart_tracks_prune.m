function trk = dart_tracks_prune(trk, t, p, R_IB, cfg)
%DART_TRACKS_PRUNE Forget tracks that are no longer useful (method §6).
%   Dynamic tracks: forgotten when their position uncertainty has become
%   uninformative while out of view (sigma > sigma_forget). Without this,
%   the inflation d_eff of a moving obstacle that is never re-observed
%   grows without bound and the safety filter ends up fleeing from an
%   ever-expanding uncertainty ball.
%   Static tracks: their uncertainty barely grows, so they are kept as a
%   local obstacle memory and forgotten only when out of view AND farther
%   than forget_dist. Forgetting a nearby static obstacle is unsafe: the
%   camera looks forward, so a manoeuvre that moves the vehicle backwards
%   or sideways would otherwise run into space that was seen before but is
%   no longer represented.
ids = find(trk.active);
for k = 1:numel(ids)
    i = ids(k);
    [x, P] = dart_track_predict(trk, i, t, cfg);
    if dart_in_fov(x(1:3), p, R_IB, cfg)
        continue
    end
    if trk.static(i)
        forget = norm(x(1:3) - p) - trk.rho(i) > cfg.trk.forget_dist;
    else
        forget = sqrt(dart_lmax_sym3(P(1:3, 1:3))) > cfg.trk.sigma_forget;
    end
    if forget
        trk.active(i) = false;
    end
end
end
