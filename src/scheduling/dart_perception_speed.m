function v = dart_perception_speed(cfg, tau_hat)
%DART_PERCEPTION_SPEED Highest speed at which an obstacle that appears at
%   the reliable detection range can still be stopped for (cf. Liu et al.,
%   ICRA 2016, Eq. 8: distance flown during processing + braking distance
%   <= sensing range):
%       v T_r + v^2 / (2 a_b) + d_s <= R_eff,
%   R_eff from DART_PERCEPTION_RANGE and the reaction time T_r = time from
%   the obstacle entering the range to the result that shows it:
%   one inference period plus the latency, T_r = max(T_gap, tau_hat) + tau_hat,
%   T_gap = 1/f for a fixed rate f, and 1/f_budget for the adaptive and
%   coverage schedulers (sched.f_budget: the compute budget - the speed is
%   chosen so that the observed space can be renewed at that rate; Inf:
%   frames back to back).
sc = cfg.sched;
if strcmp(sc.mode, 'fixed')
    T_gap = 1 / sc.f_fixed;
else
    T_gap = 1 / sc.f_budget;
end
T_r = max(T_gap, tau_hat) + tau_hat;
R_eff = dart_perception_range(cfg);
a = sc.a_b;
v = a * (-T_r + sqrt(T_r^2 + 2 * max(R_eff - sc.d_s, 0) / a));
end
