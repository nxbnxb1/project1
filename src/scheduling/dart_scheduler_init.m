function ss = dart_scheduler_init(cfg)
ss.t_last = -inf;
ss.awaiting = false;
ss.tau_m = cfg.sched.tau_init;
ss.tau_v = (0.25 * cfg.sched.tau_init)^2;
ss.emerg_until = -inf;
ss.n_trig = 0;
ss.n_lat = 0;
end
