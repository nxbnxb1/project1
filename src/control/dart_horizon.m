function [N, hz] = dart_horizon(rk, v, ss, sch, t, cfg)
%DART_HORIZON Risk-, braking- and measurement-aware horizon (method §11.2-11.3).
%   TTC is taken over obstacles whose ESTIMATED closing speed exceeds
%   v_closing, and evaluated with the conservative distance and the
%   conservative closing speed (Eq. 68-69).
%   N = clip(max{N_risk, N_brake + N_m, N_meas}, N_min, N_max)   (Eq. 78)
mp = cfg.mpc;
dt = mp.dt;
ttc = inf;
if ~isempty(rk.dc)
    closing = rk.vc > cfg.sched.v_closing;      % estimated closing speed
    if any(closing)
        ttc = min((rk.dc(closing) - cfg.sched.d_s) ./ rk.vcb(closing));   % Eq. 68-69
    end
end
ttc = max(ttc, 0);
rho = min(max((mp.T_act - ttc) / (mp.T_act - mp.T_crit), 0), 1);          % Eq. 70
N_risk = ceil((mp.TH_min + rho * (mp.TH_max - mp.TH_min)) / dt - 1e-9);   % Eq. 71-72
N_brake = ceil(norm(v) / cfg.sched.a_b / dt - 1e-9);                     % Eq. 73-74 (full stop)
if ss.awaiting
    T_new = max(0, ss.t_last + sch.tau_hat - t);                          % frame in flight
else
    T_new = max(0, ss.t_last + sch.T_scan - t) + sch.tau_hat;             % Eq. 75
end
if ttc < mp.T_act
    N_meas = min(ceil(T_new / dt - 1e-9), mp.N_max);                      % Eq. 77
else
    N_meas = mp.N_min;
end
N_ad = min(max(max([N_risk, N_brake + mp.N_margin, N_meas]), mp.N_min), mp.N_max);
if strcmp(mp.N_mode, 'fixed')
    N = max(mp.N_fixed, N_brake + 1);
else
    N = N_ad;
end
if sch.emergency
    N = max(N, mp.N_max);
end
hz = struct('ttc', ttc, 'rho', rho, 'N_risk', N_risk, 'N_brake', N_brake, ...
    'N_meas', N_meas, 'T_new', T_new);
end
