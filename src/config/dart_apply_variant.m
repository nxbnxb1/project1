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
%   Z_ZHUYI   E with a Zhuyi-style scheduler: the tolerable open-loop time is
%             derived from braking kinematics on the POINT estimate only (no
%             covariance growth, no uncertainty trigger) and there is no
%             frontier term for unseen obstacles (cf. Hsiao et al., DAC 2022)
%   O_ORACLE  E with the old oracle perception (assumption A6): ray-caster
%             instance labels instead of segmenting the depth image, and
%             association by the true instance id
%   R_GOAL    E without the set path: carrot straight to the goal (old reference)
%   R_TRACK   E tracking the set path at all times (deviation always
%             penalised, no rejoin segment)
%   R_STRAIGHT E with the rejoin segment drawn as a straight line to the
%             rejoin point (no detour plan around the obstacles)
%   FR_SAFE_f E with a fixed perception rate of f Hz (e.g. FR_SAFE_5),
%             used for the rate sweep / Pareto study
%   FN_SAFE_n E with a fixed MPC horizon of n steps (e.g. FN_SAFE_30),
%             used for the horizon study
%
%   Variants A-D keep the (point-estimate) obstacle constraints in the MPC
%   but no uncertainty inflation and no CBF filter.

name = upper(name);
if strncmp(name, 'FR_SAFE_', 8)
    cfg = set_layers(cfg, 'fixed', 'adaptive', true);
    cfg.sched.f_fixed = str2double(name(9:end));
    cfg.variant = name;
    return
end
if strncmp(name, 'FN_SAFE_', 8)
    cfg = set_layers(cfg, 'adaptive', 'fixed', true);
    cfg.mpc.N_fixed = str2double(name(9:end));
    cfg.variant = name;
    return
end
switch name
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
    case 'Z_ZHUYI'
        cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
        cfg.sched.uncertainty = false;
        cfg.sched.frontier = false;
    case 'O_ORACLE'
        cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
        cfg.seg.oracle = true;
        cfg.trk.oracle_assoc = true;
    case 'R_GOAL'
        cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
        cfg.ref.mode = 'goal';
    case 'R_TRACK'
        cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
        cfg.ref.mode = 'track';
    case 'R_STRAIGHT'
        cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
        cfg.ref.plan = false;
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
