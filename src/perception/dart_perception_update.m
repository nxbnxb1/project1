function perc = dart_perception_update(perc, t, x_true, trigger)
%DART_PERCEPTION_UPDATE Capture a frame when triggered and the engine is idle.
%   The image is rendered from the TRUE pose at the capture time t_c = t,
%   passed through the synthetic depth network, converted to obstacle
%   measurements and scheduled for release after the random latency.
if ~(trigger > 0.5) || perc.busy
    return
end
cfg = perc.cfg;
w = perc.world;
centers = w.c0 + w.v * t;
R_IB = dart_quat2rotm(x_true(7:10));
[depth, inst] = dart_render_depth(perc.cam, x_true(1:3), R_IB, cfg, centers, w.rho);
depth_hat = dart_depth_network(depth, cfg, perc.rs);
det = dart_extract_obstacles(depth_hat, inst, perc.cam, cfg);

% total perception latency (Eq. 13) with a log-normal inference time
cv = cfg.lat.inf_cv;
s_ln = sqrt(log(1 + cv^2));
m_ln = log(cfg.lat.inf_mean) - 0.5 * s_ln^2;
tau_inf = exp(m_ln + s_ln * dart_randn(perc.rs, 1, 1));
tau_inf = min(max(tau_inf, cfg.lat.inf_min), cfg.lat.inf_max);
tau = cfg.lat.t_capture + tau_inf + cfg.lat.t_comm;

perc.busy = true;
perc.t_c = t;
perc.t_a = t + tau;
perc.pending = dart_msg_pack(t, t + tau, det, cfg);
perc.n_capt = perc.n_capt + 1;
perc.e_gpu = perc.e_gpu + cfg.lat.P_gpu * tau_inf;
perc.t_busy = perc.t_busy + tau_inf;
perc.last_tau = tau;
end
