function cfg = dart_default_config()
%DART_DEFAULT_CONFIG Default parameters of the DART simulation study.
%   cfg = DART_DEFAULT_CONFIG() returns a nested struct with every tunable
%   parameter. "Eq. n" in code comments refers to the numbering of the
%   ORIGINAL proposal; docs/method/DART_method_VI.tex (Appendix D) maps
%   every equation of the revised method to its implementation.
%
%   Units: SI (m, s, rad, kg, N). Inertial frame is ENU (z up), body frame
%   is FLU, camera optical frame is (x right, y down, z forward).

% ---------------------------------------------------------------- simulation
cfg.sim.dt_plant  = 0.002;   % plant integration + attitude loop step [s]
cfg.sim.dt_ctrl   = 0.01;    % outer loop: predictor, scheduler, CBF (f_c = 100 Hz)
cfg.sim.t_max     = 30;      % hard stop [s]
cfg.sim.goal_tol  = 0.6;     % goal reached radius [m]
cfg.sim.seed      = 1;
cfg.sim.stop_on_collision = true;
cfg.sim.log_decimation = 1;  % log every n-th control tick

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
cfg.cam.min_px = 3;                  % minimum instance size for a detection

% ----------------------------------------- monocular depth network (synthetic)
cfg.depth.sigma_scale   = 0.04;      % per-frame residual scale error (log)
cfg.depth.sigma_px      = 0.03;      % per-pixel relative noise (log)
cfg.depth.sigma_px_slope = 0.004;    % growth of per-pixel noise with range [1/m]
cfg.depth.p_outlier     = 0.02;      % probability of an outlier pixel
cfg.depth.sigma_ang     = 0.5 * pi/180; % residual bearing error [rad]

% ---------------------------------------------------- perception latency
cfg.lat.t_capture  = 0.005;          % exposure + readout [s]
cfg.lat.t_comm     = 0.010;          % transfer / middleware [s]
cfg.lat.inf_mean   = 0.080;          % mean depth-network inference time [s]
cfg.lat.inf_cv     = 0.25;           % coefficient of variation (log-normal)
cfg.lat.inf_min    = 0.040;
cfg.lat.inf_max    = 0.300;
cfg.lat.P_gpu      = 15;             % accelerator power while inferring [W]

% ------------------------------------------------ obstacle tracker (Sec. 5)
cfg.trk.q_acc      = 0.02;           % white-noise acceleration PSD [m^2/s^3]
cfg.trk.sigma_v0   = 0.3;            % initial velocity std of a new track [m/s]
%                                     (prior on obstacle speed; 1.5 in the dynamic scenario)
cfg.trk.sigma_forget = 1.5;          % forget an unobserved track above this position std [m]
cfg.trk.gate       = 16.27;          % chi2(3) 99.9 % innovation gate
cfg.trk.max_reject = 3;              % consecutive rejections before re-init
cfg.trk.rho_alpha  = 0.3;            % EWMA factor of the radius estimate
cfg.trk.max_tracks = 64;
cfg.trk.delay_comp = true;           % update at capture time (Eq. 23-27)

% --------------------------------------- safety-driven scheduler (Sec. 6)
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
cfg.sched.frontier_margin = 1.0;     % surface of an unseen obstacle may be at R_max - margin
cfg.sched.v_unknown = 0.0;           % speed bound of unseen obstacles [m/s]
cfg.sched.d_trig   = 0.7;            % event trigger on conservative distance [m]
cfg.sched.sigma_trig = 0.6;          % event trigger on uncertainty [m]
cfg.sched.tau_init = 0.10;           % initial latency estimate [s]
cfg.sched.tau_quantile_k = 2.0;      % tau_hat = mean + k*std
cfg.sched.fixpoint_iter = 2;         % covariance-growth fixed-point iterations
cfg.sched.emergency_hold = 0.3;      % hysteresis of the emergency mode [s]
cfg.sched.v_closing = 0.2;           % an obstacle is 'closing' above this speed [m/s]
cfg.sched.emergency_enabled = true;  % emergency mode (max-rate perception, N_max, speed cap)

% -------------------------------------- adaptive-horizon MPC (Sec. 9)
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
cfg.mpc.a_max    = [4.0; 4.0; 3.0];
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

% ------------------------------------------------ CBF safety filter (Sec. 8)
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
cfg.cbf.fd_step  = 0.05;             % finite-difference step for d_eff rates

% ------------------------------------------------------------- mission
cfg.ref.v_des    = 4.0;              % cruise speed [m/s]
cfg.ref.a_dec    = 1.5;              % deceleration used near the goal
cfg.yaw.rate_max = 1.5;              % [rad/s]
cfg.yaw.v_thresh = 0.5;              % [m/s]

% -------------------------------------------------------- bookkeeping
cfg.variant = 'DART';
cfg.scenario = 'S1';
end
