function ss = dart_scheduler_init(cfg)
ss.t_last = -inf;
ss.awaiting = false;
ss.tau_m = cfg.sched.tau_init;
ss.tau_v = (0.25 * cfg.sched.tau_init)^2;
ss.emerg_until = -inf;
ss.n_trig = 0;
ss.n_why = zeros(1, 6);   % triggers by reason: time dist sigma urgent emergency fixed
ss.n_lat = 0;
ss.cov_o = zeros(3, 0);   % observed space: camera centres and ...
ss.cov_R = zeros(3, 3, 0); % ... orientations of the recent frames (coverage scheduler)
end
