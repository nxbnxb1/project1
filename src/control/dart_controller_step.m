function [ctrl, cmd, trigger, dg] = dart_controller_step(ctrl, t, x_true, msg)
%DART_CONTROLLER_STEP One tick (f_c) of the integrated algorithm (method §11).
%   x_true  true plant state; the controller only uses a noisy copy of it
%           (stand-in for a VIO/INS estimate)
%   msg     perception message (DART_MSG_PACK); msg(1) = 0 means "none"
%   cmd     [a_cmd(3); psi_cmd] for the attitude loop
%   trigger 1 = start a depth inference at this tick
%   dg      diagnostic vector, see DART_DIAG_NAMES
cfg = ctrl.cfg;

% ---------------------------------------------------- 1. state estimate
p = x_true(1:3) + cfg.est.sigma_p * dart_randn(ctrl.rs, 3, 1);
v = x_true(4:6) + cfg.est.sigma_v * dart_randn(ctrl.rs, 3, 1);
dth = cfg.est.sigma_att * dart_randn(ctrl.rs, 3, 1);
R_IB = dart_quat2rotm(x_true(7:10)) * dart_expm_so3(dth);
q_est = dart_rotm2quat(R_IB);
ctrl.pb = dart_posebuf_push(ctrl.pb, t, p, q_est);

% -------------------------------- 2. delayed measurement -> tracks (method §6)
latency = 0; n_det = 0;
if msg(1) > 0.5
    [hdr, det] = dart_msg_unpack(msg);
    latency = t - hdr.t_c;                       % measured tau_p
    n_det = hdr.n;
    ctrl.ss = dart_scheduler_latency(ctrl.ss, latency);
    ctrl.trk = dart_tracks_process_msg(ctrl.trk, hdr, det, ctrl.pb, t, cfg);
end

% --------------------------------------- 3. predictor at f_c (Eq. 28)
ctrl.trk = dart_tracks_prune(ctrl.trk, t, p, R_IB, cfg);
ob = dart_tracks_now(ctrl.trk, t, cfg);
rk = dart_risk_terms(ob, p, v, cfg);

% ----------------------------------------- 4. perception scheduling
[ctrl.ss, sch] = dart_scheduler(ctrl.ss, ob, rk, p, v, R_IB, t, cfg);
trigger = double(sch.trigger);

% --------------------------------------- 5. adaptive-horizon MPC (20 Hz)
solved = 0;
if t >= ctrl.t_next_mpc - 1e-9
    [N, ctrl.hz] = dart_horizon(rk, v, ctrl.ss, sch, t, cfg);
    tinfo = struct('T_new', ctrl.hz.T_new, 'T_period', max(sch.T_scan, sch.tau_hat));
    v_cap = inf;
    if sch.emergency, v_cap = sch.v_cap; end
    if strcmp(cfg.ref.mode, 'goal')
        ref = ctrl.goal;
    else
        ctrl.rj = dart_rejoin_update(ctrl.rj, ctrl.G, p, ob, cfg);   % TRACK / REJOIN
        ref = struct('G', ctrl.G, 'rj', ctrl.rj);
    end
    ctrl.sol = dart_mpc(p, v, ctrl.u_prev, ref, ob, rk, N, tinfo, ...
        v_cap, ctrl.sol, t, cfg);
    ctrl.target = ctrl.sol.target;
    ctrl.last_N = N;
    ctrl.t_next_mpc = max(ctrl.t_next_mpc, t) + cfg.mpc.period;
    if ~isfinite(ctrl.t_next_mpc), ctrl.t_next_mpc = t + cfg.mpc.period; end
    solved = 1;
end
sol = ctrl.sol;
j = min(max(floor((t - sol.t0) / sol.dt + 1e-9) + 1, 1), sol.N);
a_ref = sol.U(:, j);

% ------------------- 6. CBF safety filter (braking barrier per obstacle,
%                       blind-motion / field-of-view rows, HOCBF altitude rows)
[a_safe, cbf] = dart_cbf_filter(a_ref, p, v, ob, rk, cfg, R_IB);
ctrl.u_prev = a_safe;

% ---------------------------------------------------------- 7. yaw
jl = min(max(round((t + cfg.yaw.T_look - sol.t0) / sol.dt), 1), sol.N);
ctrl.psi = dart_yaw_policy(ctrl.psi, v, p, ctrl.target, cfg.sim.dt_ctrl, cfg, sol.P(:, jl));
cmd = [a_safe; ctrl.psi];

% -------------------------------------------------------- diagnostics
near_id = 0; near_c = [0; 0; 0]; min_dc = 99;
if ~isempty(rk.dc)
    [min_dc, kk] = min(rk.dc);
    near_id = ob.id(kk); near_c = ob.c(:, kk);
end
dg = [ctrl.last_N; sch.T_scan; ctrl.hz.rho; min(ctrl.hz.ttc, 99); min(min_dc, 99); ...
      numel(ob.id); double(sch.emergency); trigger; double(cbf.active); cbf.slack; ...
      sol.time * solved; sol.iter; sol.status; norm(a_safe - a_ref); sch.tau_hat; ...
      latency; n_det; min(cbf.h_min, 999); norm(v); sol.nrow; ...
      near_id; near_c; solved; ctrl.trk.n_gate_rej; ctrl.trk.n_del; ...
      ctrl.rj.mode; ctrl.rj.e_lat; ctrl.rj.s0; ctrl.rj.s_r; ctrl.rj.n_rejoin];
end
