function ob = dart_tracks_now(trk, t, cfg)
%DART_TRACKS_NOW Current estimates of all active tracks (predictor, Eq. 28).
%   ob.id (1xM)  ob.c (3xM)  ob.v (3xM, zero: static landmarks)
%   ob.P (6x6xM) ob.rho (1xM)  ob.q (1xM) process-noise PSD
%   Every track is a vertical cylinder (DART_CYL_DIST): axis through ob.c,
%   horizontal radius ob.rho, vertical extent [ob.zl, ob.zh] (1xM; -Inf /
%   Inf where the bottom / top has never been seen).
ids = find(trk.active);
M = numel(ids);
ob.id = ids;
ob.c = zeros(3, M); ob.v = zeros(3, M); ob.P = zeros(6, 6, M);
ob.rho = trk.rho(ids);
ob.zl = trk.zl(ids); ob.zl(trk.open_lo(ids)) = -inf;
ob.zh = trk.zh(ids); ob.zh(trk.open_hi(ids)) = inf;
ob.q = zeros(1, M);
for k = 1:M
    [x, P, q] = dart_track_predict(trk, ids(k), t, cfg);
    ob.c(:, k) = x(1:3);
    ob.v(:, k) = x(4:6);
    ob.P(:, :, k) = P;
    ob.q(k) = q;
end
end
