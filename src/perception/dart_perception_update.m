function perc = dart_perception_update(perc, t, x_true, trigger)
%DART_PERCEPTION_UPDATE Capture a frame when triggered and the engine is idle.
%   The image is rendered from the TRUE pose at the capture time t_c = t,
%   passed through the synthetic depth network, segmented (from the
%   network's depth image only, DART_SEGMENT_DEPTH), converted to obstacle
%   measurements and scheduled for release after the random latency. The
%   ray caster's instance labels are ground truth and are NOT used, unless
%   cfg.seg.oracle is set (ablation of the old assumption A6).
if ~(trigger > 0.5) || perc.busy
    return
end
cfg = perc.cfg;
w = perc.world;
R_IB = dart_quat2rotm(x_true(7:10));
[depth, inst] = dart_render_world(perc.cam, x_true(1:3), R_IB, cfg, w, t);
depth_hat = dart_depth_network(depth, cfg, perc.rs);
vis_cnt = accumarray(inst(inst > 0).', 1, [numel(perc.seen_t), 1]);   % evaluation only
perc.seen_t(vis_cnt.' >= cfg.cam.min_px) = t;
if ~cfg.seg.oracle
    inst = dart_segment_depth(depth_hat, perc.cam, cfg);
end
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
