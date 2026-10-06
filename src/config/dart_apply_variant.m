function cfg = dart_apply_variant(cfg, name)
%DART_APPLY_VARIANT Configure one method of the ablation study (Sec. 11).
%
%   A_FR_FN   fixed-rate perception (10 Hz) + fixed-N MPC
%   B_AP_FN   adaptive perception          + fixed-N MPC
%   C_FR_AN   fixed-rate perception        + adaptive-N MPC
%   D_AP_AN   adaptive perception          + adaptive-N MPC
%   E_DART    D + uncertainty inflation + HOCBF filter (full method)
%   F_NODELAY E without timestamp (delay) compensation
%   G_FR_LOW  E with a fixed low perception rate (3 Hz) instead of the scheduler
%
%   Variants A-D keep the (point-estimate) obstacle constraints in the MPC
%   but no uncertainty inflation and no CBF filter.

switch upper(name)
    case 'A_FR_FN'
        cfg = set_layers(cfg, 'fixed', 'fixed', false);
    case 'B_AP_FN'
        cfg = set_layers(cfg, 'adaptive', 'fixed', false);
    case 'C_FR_AN'
        cfg = set_layers(cfg, 'fixed', 'adaptive', false);
    case 'D_AP_AN'
        cfg = set_layers(cfg, 'adaptive', 'adaptive', false);
    case {'E_DART', 'DART'}
        cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
    case 'F_NODELAY'
        cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
        cfg.trk.delay_comp = false;
    case 'G_FR_LOW'
        cfg = set_layers(cfg, 'fixed', 'adaptive', true);
        cfg.sched.f_fixed = 3;
    otherwise
        error('dart:variant', 'Unknown variant %s', name);
end
cfg.variant = upper(name);
end

function cfg = set_layers(cfg, sched_mode, n_mode, safety)
cfg.sched.mode = sched_mode;
cfg.mpc.N_mode = n_mode;
cfg.cbf.enabled = safety;
cfg.sched.emergency_enabled = safety;
if safety
    cfg.mpc.beta_s = 2.0;
    cfg.mpc.expected_reset = true;
else
    cfg.mpc.beta_s = 0.0;
    cfg.mpc.expected_reset = false;
end
end
