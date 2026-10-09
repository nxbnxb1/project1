function cfg = dart_apply_tradeoff(cfg)
%DART_APPLY_TRADEOFF One hyperparameter kappa in [0, 1] trading safety
%   margin ("stability") against the time to the goal.
%     kappa = 0    most conservative: large margins, slow blind motion
%     kappa = 0.5  the default configuration (all nominal values)
%     kappa = 1    most aggressive: small margins, fast blind motion
%   Every safety margin of the method is scaled geometrically from its
%   nominal value p0 (cfg.tradeoff.nominal) by a factor r^(+-(2 kappa - 1)):
%     uncertainty inflation  beta_s      = beta0  * 1.5^(1 - 2 kappa)
%     braking-barrier gain   cbf.alpha   = alpha0 * 1.5^(2 kappa - 1)
%     clearance margin       d_s - r_body = m0    * 2^(1 - 2 kappa)
%     blind speeds           v_blind, v_blind_lat = v0 * 2^(2 kappa - 1)
%     "blocked" margin       ref.margin  = mr0    * 2^(1 - 2 kappa)
%   The function is idempotent (it always starts from the nominal values);
%   variants without the safety layers keep beta_s = 0.
k = min(max(cfg.tradeoff.kappa, 0), 1);
nm = cfg.tradeoff.nominal;
e = 2 * k - 1;
if cfg.mpc.beta_s > 0
    cfg.mpc.beta_s = nm.beta_s * 1.5^(-e);
end
cfg.cbf.alpha = nm.cbf_alpha * 1.5^e;
cfg.sched.d_s = cfg.quad.r_body + (nm.d_s - cfg.quad.r_body) * 2^(-e);
cfg.cbf.v_blind = nm.v_blind * 2^e;
cfg.cbf.v_blind_lat = nm.v_blind_lat * 2^e;
cfg.ref.margin = nm.ref_margin * 2^(-e);
end
