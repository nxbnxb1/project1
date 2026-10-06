function trk = dart_tracks_prune(trk, t, p, R_IB, cfg)
%DART_TRACKS_PRUNE Forget tracks whose position uncertainty has become
%   uninformative while they are out of view (sigma > sigma_forget).
%   Without this, the inflation d_eff of an obstacle that is never
%   re-observed grows without bound and the safety filter ends up fleeing
%   from an ever-expanding uncertainty ball. An obstacle in the direction of
%   travel is re-detected in time thanks to the frontier term (Sec. 6.4).
ids = find(trk.active);
for k = 1:numel(ids)
    i = ids(k);
    [x, P] = dart_track_predict(trk, i, t, cfg.trk.q_acc);
    if sqrt(dart_lmax_sym3(P(1:3, 1:3))) > cfg.trk.sigma_forget ...
            && ~dart_in_fov(x(1:3), p, R_IB, cfg)
        trk.active(i) = false;
    end
end
end
