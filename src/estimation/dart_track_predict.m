function [x, P] = dart_track_predict(trk, i, t, q)
%DART_TRACK_PREDICT Mean and covariance of track i at time t >= t_upd.
dt = max(t - trk.t_upd(i), 0);
[F, Q] = dart_cv_model(dt, q);
x = F * trk.x(:, i);
P = F * trk.P(:, :, i) * F.' + Q;
end
