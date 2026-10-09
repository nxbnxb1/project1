function [x, P, q] = dart_track_predict(trk, i, t, cfg)
%DART_TRACK_PREDICT Mean and covariance of track i at time t >= t_upd.
%   Static landmark (method §6): the position is constant and the
%   covariance grows only by the process noise q = cfg.trk.q_static (every
%   downstream covariance propagation of this obstacle must use q).
dt = max(t - trk.t_upd(i), 0);
q = cfg.trk.q_static;
[F, Q] = dart_cv_model(dt, q);
x = F * trk.x(:, i);
P = F * trk.P(:, :, i) * F.' + Q;
end
