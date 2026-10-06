function ob = dart_tracks_now(trk, t, cfg)
%DART_TRACKS_NOW Current estimates of all active tracks (predictor, Eq. 28).
%   ob.id (1xM)  ob.c (3xM)  ob.v (3xM)  ob.P (6x6xM)  ob.rho (1xM)
%   ob.q (1xM)   process-noise PSD of the selected model
%   ob.static (1xM)
ids = find(trk.active);
M = numel(ids);
ob.id = ids;
ob.c = zeros(3, M); ob.v = zeros(3, M); ob.P = zeros(6, 6, M);
ob.rho = trk.rho(ids);
ob.q = zeros(1, M);
ob.static = trk.static(ids);
for k = 1:M
    [x, P, q] = dart_track_predict(trk, ids(k), t, cfg);
    ob.c(:, k) = x(1:3);
    ob.v(:, k) = x(4:6);
    ob.P(:, :, k) = P;
    ob.q(k) = q;
end
end
