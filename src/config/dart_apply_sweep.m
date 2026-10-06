function cfg = dart_apply_sweep(cfg, name, value)
%DART_APPLY_SWEEP Set one swept quantity of the sensitivity study.
%   latency   mean depth-inference time [s] (bounds scale with it)
%   speed     cruise speed v_des [m/s]
%   rate      perception rate of the fixed-rate variants [Hz]
%   noise     residual monocular scale error sigma_scale [-]
%   shift     residual inverse-depth shift error sigma_shift [1/m]
%   none      no change (value ignored)
switch lower(name)
    case 'latency'
        cfg.lat.inf_mean = value;
        cfg.lat.inf_min = min(cfg.lat.inf_min, 0.5 * value);
        cfg.lat.inf_max = max(cfg.lat.inf_max, 2.5 * value);
    case 'speed'
        cfg.ref.v_des = value;
    case 'rate'
        cfg.sched.f_fixed = value;
    case 'noise'
        cfg.depth.sigma_scale = value;
    case 'shift'
        cfg.depth.sigma_shift = value;
    case 'none'
    otherwise
        error('dart:sweep', 'Unknown sweep parameter %s', name);
end
end
