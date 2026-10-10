function cfg = dart_apply_variant(cfg, name)
%DART_APPLY_VARIANT Configure one method of the ablation study (method §16.6).
%
%   A_FR_FN   fixed-rate perception (10 Hz) + fixed-N MPC
%   B_AP_FN   adaptive perception          + fixed-N MPC
%   C_FR_AN   fixed-rate perception        + adaptive-N MPC
%   D_AP_AN   adaptive perception          + adaptive-N MPC
%   E_DART    D + uncertainty inflation + braking-CBF filter + emergency mode,
%             set path with planned detour (full method)
%   F_NODELAY E without timestamp (delay) compensation
%   G_FR_LOW  E with a fixed low perception rate (3 Hz) instead of the scheduler
%   Z_ZHUYI   E with a Zhuyi-style scheduler: the tolerable open-loop time is
%             derived from braking kinematics on the POINT estimate only (no
%             covariance growth, no uncertainty trigger) and there is no
%             frontier term for unseen obstacles (cf. Hsiao et al., DAC 2022)
%   E_COV     E with the coverage scheduler (sched.mode = 'coverage'): infer
%             only when the planned path ahead leaves the observed space
%   COVB<f>   E_COV with a compute budget of f Hz (sched.f_budget; e.g. COVB1,
%             COVB5; E_COV = COVB3): the speed cap follows from the budget
%   E_NOCAP   E without the perception speed cap (ref.perc_speed = false)
%   FRNC<f>   fixed rate f Hz with the safety layers but WITHOUT the speed cap
%   COV_EV    E_COV that also re-images known obstacles (distance and
%             uncertainty events, as in round 4a)
%   COV_NOCAP E_COV without the perception speed cap
%   O_ORACLE  E with the oracle perception of the OLD assumption A6 (the
%             current A6 states that no labels are available): ray-caster
%             instance labels instead of segmenting the depth image, and
%             association by the true instance id
%   R_GOAL    E without the set path: carrot straight to the goal (old reference)
%   R_TRACK   E tracking the set path at all times (deviation always
%             penalised, no rejoin segment)
%   R_STRAIGHT E with the rejoin segment drawn as a straight line to the
%             rejoin point (no detour plan around the obstacles)
%   K<k>      E with the safety <-> time trade-off kappa = k/100
%             (e.g. K0, K25, K50 = E_DART, K100); kappa takes effect in
%             DART_APPLY_TRADEOFF, called by DART_RUN_CASE (callers of
%             DART_SIM must call it themselves)
%   MEM<d>    E with an obstacle memory of d metres (cfg.trk.forget_dist = d;
%             default 10; MEM0: tracks forgotten as soon as they leave the view)
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
if strncmp(name, 'MEM', 3) && numel(name) > 3 && all(isstrprop(name(4:end), 'digit'))
    cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
    cfg.trk.forget_dist = str2double(name(4:end));
    cfg.variant = name;
    return
end
if numel(name) >= 2 && name(1) == 'K' && all(isstrprop(name(2:end), 'digit'))
    cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
    cfg.tradeoff.kappa = str2double(name(2:end)) / 100;
    cfg.variant = name;
    return
end
if strncmp(name, 'COVB', 4) && numel(name) > 4
    cfg = set_layers(cfg, 'coverage', 'adaptive', true);
    cfg.sched.f_budget = str2double(name(5:end));
    cfg.variant = name;
    return
end
if strncmp(name, 'FRNC', 4) && numel(name) > 4
    % fixed rate f Hz without the perception speed cap (e.g. FRNC1, FRNC3)
    cfg = set_layers(cfg, 'fixed', 'adaptive', true);
    cfg.sched.f_fixed = str2double(name(5:end));
    cfg.ref.perc_speed = false;
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
    case 'E_COV'
        cfg = set_layers(cfg, 'coverage', 'adaptive', true);
    case 'E_NOCAP'
        cfg = set_layers(cfg, 'adaptive', 'adaptive', true);
        cfg.ref.perc_speed = false;
    case 'COV_EV'
        cfg = set_layers(cfg, 'coverage', 'adaptive', true);
        cfg.sched.cov_events = true;
    case 'COV_NOCAP'
        cfg = set_layers(cfg, 'coverage', 'adaptive', true);
        cfg.ref.perc_speed = false;
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
cfg.ref.perc_speed = safety;
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
