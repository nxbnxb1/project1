function [x, P, q] = dart_track_predict(trk, i, t, cfg)
%DART_TRACK_PREDICT Mean and covariance of track i at time t >= t_upd,
%   taken from the model currently selected for the track (Sec. 5.3):
%   the stationary filter (x_s, P_s, q_static) once the track has been
%   classified static, the constant-velocity filter (x, P, q_acc) otherwise.
%   q is the process-noise PSD of the selected model; every downstream
%   covariance propagation of this obstacle must use it.
dt = max(t - trk.t_upd(i), 0);
if trk.static(i)
    q = cfg.trk.q_static;
    [F, Q] = dart_cv_model(dt, q);
    x = F * trk.xs(:, i);
    P = F * trk.Ps(:, :, i) * F.' + Q;
else
    q = cfg.trk.q_acc;
    [F, Q] = dart_cv_model(dt, q);
    x = F * trk.x(:, i);
    P = F * trk.P(:, :, i) * F.' + Q;
end
end
