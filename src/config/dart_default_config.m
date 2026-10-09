function cfg = dart_default_config()
%DART_DEFAULT_CONFIG Default parameters of the DART simulation study.
%   cfg = DART_DEFAULT_CONFIG() returns a nested struct with every tunable
%   parameter. Conventions in code comments: "Eq. n" is the equation
%   numbering of the ORIGINAL proposal; "method §n" is a section of the
%   revised method docs/method/DART_method_VI.tex, whose Appendix D maps
%   its equations and components to the implementing files.
%   Six safety margins below (mpc.beta_s, cbf.alpha, sched.d_s,
%   cbf.v_blind, cbf.v_blind_lat, ref.margin) are NOMINAL values: the
%   trade-off hyperparameter tradeoff.kappa rescales them in
%   DART_APPLY_TRADEOFF (called by DART_RUN_CASE); kappa = 0.5 keeps them.
%
%   Units: SI (m, s, rad, kg, N). Inertial frame is ENU (z up), body frame
%   is FLU, camera optical frame is (x right, y down, z forward).

% ---------------------------------------------------------------- simulation
cfg.sim.dt_plant  = 0.002;   % plant integration + attitude loop step [s]
cfg.sim.dt_ctrl   = 0.01;    % outer loop: predictor, scheduler, CBF (f_c = 100 Hz)
cfg.sim.t_max     = inf;     % no time limit: the time to the goal is measured, not limited
cfg.sim.stuck_window = 60;   % a run ends as 'stuck' after this long without ...
cfg.sim.stuck_dist = 1.0;    % ... this much progress along the set path [s, m]
cfg.sim.t_cap     = 1800;    % compute guard only (outcome 'cap'), never expected
cfg.sim.goal_tol  = 0.6;     % goal reached radius [m]
cfg.sim.seed      = 1;
cfg.sim.stop_on_collision = true;
cfg.sim.log_decimation = 1;  % log every n-th control tick
cfg.sim.debug    = false;   % MATLAB engine: log the track nearest to the truly closest obstacle (tracks have no identity)

% --------------------------------------------------------------- quadrotor
cfg.quad.m        = 1.0;
cfg.quad.g        = 9.81;
cfg.quad.J        = [0.0082; 0.0082; 0.0149];
cfg.quad.kd       = 0.10;            % linear aerodynamic drag [N/(m/s)]
cfg.quad.tau_mot  = 0.02;            % thrust/torque first-order lag [s]
cfg.quad.f_max    = 2.2 * 1.0 * 9.81;
cfg.quad.tau_lim  = [1.0; 1.0; 0.3]; % body torque limits [N m]
cfg.quad.tilt_max = 35 * pi/180;
cfg.quad.r_body   = 0.25;            % collision radius of the vehicle [m]
cfg.quad.wind_mean = [0; 0; 0];      % mean wind velocity [m/s]
cfg.quad.wind_gust = [0.0; 0.0; 0];  % gust amplitude [m/s]
cfg.quad.wind_freq = 0.3;            % gust frequency [Hz]

% Geometric attitude controller (Lee et al. 2010), runs at 1/dt_plant
cfg.att.kR = [6.0; 6.0; 1.5];
cfg.att.kW = [0.35; 0.35; 0.20];
cfg.att.drag_comp = true;            % feed-forward of the nominal drag

% ------------------------------------------------- state estimate (VIO/INS)
cfg.est.sigma_p   = 0.02;            % position noise std [m]
cfg.est.sigma_v   = 0.03;            % velocity noise std [m/s]
cfg.est.sigma_att = 0.3 * pi/180;    % attitude noise std [rad]
cfg.est.buffer_len = 200;            % pose buffer length (control ticks)

% ------------------------------------------------------------------ camera
cfg.cam.W     = 80;                  % synthetic depth image width  [px]
cfg.cam.H     = 60;                  % synthetic depth image height [px]
cfg.cam.hfov  = 90 * pi/180;
cfg.cam.R_max = 15;                  % maximum reliable depth [m]
cfg.cam.p_BC  = [0.10; 0; 0];        % camera lever arm in body frame
cfg.cam.R_BC  = [0 0 1; -1 0 0; 0 -1 0]; % optical -> body (FLU)
cfg.cam.min_px = 3;                  % minimum segment size for a detection [px]
cfg.cam.r_chunk = 1.0;               % segments wider than this (lateral half-extent) are split [m]
cfg.cam.cover_q = 0.9;               % the sphere covers this quantile of the segment's surface points

% ----------------------------------------- monocular depth network (synthetic)
cfg.depth.sigma_scale   = 0.04;      % per-frame residual scale error (log)
cfg.depth.sigma_shift   = 0.0;       % per-frame residual inverse-depth SHIFT error [1/m]
%                                     (affine-invariant relative-depth nets; 0 = metric/aligned net)
cfg.depth.sigma_px      = 0.03;      % per-pixel relative noise (log)
cfg.depth.sigma_px_slope = 0.004;    % growth of per-pixel noise with range [1/m]
cfg.depth.p_outlier     = 0.02;      % probability of an outlier pixel
cfg.depth.sigma_ang     = 0.5 * pi/180; % residual bearing error [rad]

% ------------------------- obstacle segmentation of the depth image (method §4.2)
% The vehicle only sees the network's depth image: no instance labels.
cfg.seg.oracle  = false;             % true: ray-caster instance labels (old assumption A6, ablation only)
cfg.seg.tau_out = 0.25;              % outlier: |log d - 3x3 median| above this
cfg.seg.tau0    = 0.05;              % neighbours joined if |dlog d| <= tau0 + k_sig * sigma_px(d)
cfg.seg.k_sig   = 0.5;               % (calibrated on held-out scenario seeds 100-149)

% ---------------------------------------------------- perception latency
cfg.lat.t_capture  = 0.005;          % exposure + readout [s]
cfg.lat.t_comm     = 0.010;          % transfer / middleware [s]
cfg.lat.inf_mean   = 0.080;          % mean depth-network inference time [s]
cfg.lat.inf_cv     = 0.25;           % coefficient of variation (log-normal)
cfg.lat.inf_min    = 0.040;
cfg.lat.inf_max    = 0.300;
cfg.lat.P_gpu      = 15;             % accelerator power while inferring [W]

% ------------------------------------------------ obstacle tracker (method §6)
cfg.trk.q_acc      = 0.02;           % white-noise acceleration PSD [m^2/s^3]
cfg.trk.sigma_v0   = 0.3;            % initial velocity std of a new track [m/s]
%                                     (prior on obstacle speed; 1.0 in S2 and in SR worlds with movers)
cfg.trk.sigma_forget = 1.5;          % forget an unobserved DYNAMIC track above this position std [m]
cfg.trk.static_cls = true;           % two-model bank: classify stationary obstacles (method §6)
cfg.trk.q_static   = 1e-4;           % process-noise PSD of the stationary model [m^2/s^3]
cfg.trk.sigma_v_static = 0.05;       % velocity prior std of the stationary model [m/s]
cfg.trk.T_static   = 2.0;            % observation time required before a track may be classified static [s]
cfg.trk.n_static   = 5;              % ... and number of updates
cfg.trk.p_switch   = 0.005;          % Markov switching probability between the two models
cfg.trk.mu_static  = 0.95;           % static if the stationary-model probability >= this
cfg.trk.v_static   = 0.3;            % ... and the CV speed estimate <= this [m/s]
cfg.trk.mu_revert  = 0.5;            % hysteresis: back to dynamic if the probability < this
cfg.trk.v_revert   = 0.8;            % ... or CV speed > this [m/s]
cfg.trk.forget_dist = 10.0;          % static tracks are forgotten only beyond this range [m]
cfg.trk.gate       = 16.27;          % chi2(3) 99.9 % innovation gate
cfg.trk.max_reject = 3;              % consecutive rejections before re-init (oracle association only)
cfg.trk.oracle_assoc = false;        % true: slot = ray-caster instance id (needs seg.oracle; ablation only)
cfg.trk.n_confirm  = 2;              % a track with fewer updates is tentative (deleted at its first miss)
cfg.trk.n_miss     = 3;              % consecutive misses (expected in view, not detected) before deletion
cfg.trk.rho_alpha  = 0.3;            % EWMA factor of the radius estimate
cfg.trk.max_tracks = 64;
cfg.trk.delay_comp = true;           % update at capture time (Eq. 23-27)

% --------------------------------------- safety-driven scheduler (method §7)
cfg.sched.mode     = 'adaptive';     % 'adaptive' | 'fixed'
cfg.sched.f_fixed  = 10;             % rate of the fixed-rate baseline [Hz]
cfg.sched.d_s      = 0.50;           % required clearance (body + margin) [m]
cfg.sched.a_b      = 4.0;            % guaranteed braking deceleration [m/s^2]
cfg.sched.a_plus   = 2.0;            % vehicle acceleration toward UNSEEN space (frontier)
cfg.sched.beta_d   = 2.0;            % distance uncertainty multiplier (Eq. 35)
cfg.sched.beta_v   = 2.0;            % closing-speed uncertainty multiplier
cfg.sched.T_min    = 0.05;
cfg.sched.T_max    = 1.0;
cfg.sched.frontier = true;           % unknown-space (frontier) constraint
cfg.sched.uncertainty = true;        % covariance growth in the safe open-loop time (false: Zhuyi-style baseline)
cfg.sched.frontier_margin = 1.0;     % surface of an unseen obstacle may be at R_max - margin
cfg.sched.v_unknown = 0.0;           % speed bound of unseen obstacles [m/s]
cfg.sched.d_trig   = 0.7;            % event trigger on conservative distance [m]
cfg.sched.sigma_trig = 0.6;          % event trigger on uncertainty [m]
cfg.sched.info_gain = 2.0;           % ... only if sigma^2 >= info_gain * expected measurement variance
cfg.sched.tau_init = 0.10;           % initial latency estimate [s]
cfg.sched.tau_quantile_k = 2.0;      % tau_hat = mean + k*std
cfg.sched.fixpoint_iter = 2;         % covariance-growth fixed-point iterations
cfg.sched.emergency_hold = 0.3;      % hysteresis of the emergency mode [s]
cfg.sched.v_closing = 0.2;           % an obstacle is 'closing' above this speed [m/s]
cfg.sched.emergency_enabled = true;  % emergency mode (max-rate perception, N_max, speed cap)

% -------------------------------------- adaptive-horizon MPC (method §10)
cfg.mpc.dt       = 0.10;             % prediction step Delta t_m
cfg.mpc.period   = 0.05;             % re-solve period (20 Hz)
cfg.mpc.N_mode   = 'adaptive';       % 'adaptive' | 'fixed'
cfg.mpc.N_fixed  = 20;
cfg.mpc.N_min    = 10;
cfg.mpc.N_max    = 30;
cfg.mpc.TH_min   = 1.0;
cfg.mpc.TH_max   = 3.0;
cfg.mpc.T_act    = 2.5;
cfg.mpc.T_crit   = 0.8;
cfg.mpc.N_margin = 3;
cfg.mpc.Qp       = [0.4; 0.4; 2.0];  % position weights (diag)
cfg.mpc.Qv       = [1.0; 1.0; 1.0];  % velocity weights (diag)
cfg.mpc.R        = [0.05; 0.05; 0.05];
cfg.mpc.S        = [0.20; 0.20; 0.20];
cfg.mpc.a_max    = [4.6; 4.6; 3.0];  % >= a_b + a_bar_o + delta_a horizontally (checked by dart_check_config);
%                                     tilt_max = 35 deg allows ~6.9 m/s^2 horizontally at hover thrust
cfg.mpc.v_max    = [5.0; 5.0; 1.5];
cfg.mpc.z_lim    = [0.7; 4.0];
cfg.mpc.gamma    = 0.3;              % discrete-time CBF rate (Eq. 85), 1 = direct only
cfg.mpc.N_dcbf   = 10;               % DCBF rows on the first N_dcbf steps
cfg.mpc.beta_s   = 2.0;              % uncertainty inflation (Eq. 82), 0 = off
cfg.mpc.M_obs    = 6;                % max obstacles in the QP
cfg.mpc.relevance = 2.0;             % extra distance for obstacle selection [m]
cfg.mpc.slack_w1 = 1e3;
cfg.mpc.slack_w2 = 1e4;
cfg.mpc.terminal_stop = true;        % ||v_N|| <= eps_v (safe stopping set)
cfg.mpc.eps_v    = 0.05;
cfg.mpc.expected_reset = true;       % Eq. 79-80
cfg.mpc.side_angle = 60 * pi/180;    % max angle between half-space normal and -travel dir
cfg.mpc.solver   = 'ipm';            % 'ipm' (built-in) | 'quadprog'

% ------------------------------------------------ CBF safety filter (method §9)
cfg.cbf.enabled  = true;
cfg.cbf.type     = 'braking';        % 'braking' (default) | 'hocbf' (original proposal)
cfg.cbf.alpha    = 3.0;              % class-K gain of the braking barrier [1/s]
cfg.cbf.s_min    = 0.05;             % gap regularisation of sqrt(2 a_b s) [m]
cfg.cbf.p1       = 3.0;              % HOCBF / altitude rows: k1 = p1+p2, k0 = p1*p2
cfg.cbf.p2       = 3.0;
cfg.cbf.W        = [1; 1; 1];
cfg.cbf.d_active = 8.0;              % only obstacles closer than this
cfg.cbf.a_bar_o  = 0.0;              % obstacle acceleration bound (Eq. 60)
cfg.cbf.delta_a  = 0.3;              % inner-loop tracking error bound [m/s^2]
cfg.cbf.slack_w  = 1e4;
cfg.cbf.slack_w_alt = 1e6;           % separate, heavier slack of the altitude (ground) rows
cfg.cbf.v_blind  = 1.5;              % max speed away from the camera view (blind motion) [m/s]; inf = off
cfg.cbf.v_blind_lat = 1.0;           % max speed sideways beyond the edges of the field of view [m/s]
cfg.cbf.fov_margin = 10 * pi/180;    % the field of view counts as hfov/2 - fov_margin
cfg.cbf.fd_step  = 0.05;             % finite-difference step for d_eff rates

% ------------------------------------------------------------- mission
cfg.ref.v_des    = 4.0;              % cruise speed [m/s]
cfg.ref.a_dec    = 1.5;              % deceleration used near the goal
% set path (the mission's reference trajectory) and rejoin logic (method §10.5)
cfg.ref.mode     = 'rejoin';         % 'rejoin' | 'track' (always penalise deviation from the path)
%                                      | 'goal' (old carrot straight to the goal, no path)
cfg.ref.L_look   = 10.0;             % look-ahead along the path for blocking obstacles [m]
cfg.ref.L_trig   = 6.0;              % a detour starts when a blocked stretch begins this close ahead [m]
cfg.ref.ds       = 0.25;             % sampling of the path [m]
cfg.ref.margin   = 0.20;             % extra clearance for "blocked" [m]
cfg.ref.gap_merge = 4.0;             % blocked stretches closer than this are one (~1 s at cruise) [m]
cfg.ref.m_rejoin = 1.0;              % rejoin this far behind the blocked stretch [m]
cfg.ref.e_on     = 0.3;              % ... and the cross-track error <= e_on [m]
cfg.ref.e_off    = 1.0;              % TRACK -> REJOIN when the cross-track error exceeds this [m]
cfg.ref.L_min    = 3.0;              % rejoin point ahead when merely off the path [m]
cfg.ref.plan     = true;             % plan the short segment around the obstacles (false: straight to the rejoin point)
cfg.ref.n_vert   = 8;                % polygon vertices per obstacle disc in the detour plan
cfg.ref.T_move   = 0.5;              % extra disc radius |v_o| * T_move for moving obstacles [s]
cfg.ref.valid_tol = 0.9;             % keep the planned detour while it clears 0.9 x the disc radii
cfg.ref.back     = 1.0;              % projection window behind / ahead of the last progress [m]
cfg.ref.fwd      = 8.0;
cfg.yaw.rate_max = 1.5;              % [rad/s]
cfg.yaw.v_thresh = 0.5;              % [m/s]
cfg.yaw.T_look   = 0.6;              % look at the MPC's predicted position this far ahead [s]

% -------------------------------------------------------- bookkeeping
cfg.variant = 'DART';
cfg.scenario = 'S1';

% ------------------------------------- safety <-> time-to-goal trade-off
% One hyperparameter (DART_APPLY_TRADEOFF, applied by DART_RUN_CASE):
% 0 = most conservative, 0.5 = the values above, 1 = most aggressive.
cfg.tradeoff.kappa = 0.5;
cfg.tradeoff.nominal = struct('beta_s', cfg.mpc.beta_s, 'cbf_alpha', cfg.cbf.alpha, ...
    'd_s', cfg.sched.d_s, 'v_blind', cfg.cbf.v_blind, 'v_blind_lat', cfg.cbf.v_blind_lat, ...
    'ref_margin', cfg.ref.margin);
end
