function ss = dart_scheduler_latency(ss, tau)
%DART_SCHEDULER_LATENCY Update latency statistics with a measured tau_p.
a = 0.2;
ss.n_lat = ss.n_lat + 1;
if ss.n_lat == 1
    ss.tau_m = tau;
else
    dm = tau - ss.tau_m;
    ss.tau_m = ss.tau_m + a * dm;
    ss.tau_v = (1 - a) * (ss.tau_v + a * dm^2);
end
ss.awaiting = false;
end
