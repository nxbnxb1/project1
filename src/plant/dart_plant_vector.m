function P = dart_plant_vector(cfg)
%DART_PLANT_VECTOR Pack plant + attitude-loop parameters into a numeric
%   vector. A flat vector is the simplest way to feed the codegen-compiled
%   MATLAB Function blocks of the Simulink model (one Constant block).
%
%   Layout (27 x 1):
%    1 m | 2 g | 3:5 J | 6 kd | 7 tau_mot | 8 f_max | 9:11 tau_lim
%   12 tilt_max | 13:15 wind_mean | 16:18 wind_gust | 19 wind_freq
%   20:22 kR | 23:25 kW | 26 drag_comp | 27 kd_hat
q = cfg.quad; a = cfg.att;
P = [q.m; q.g; q.J(:); q.kd; q.tau_mot; q.f_max; q.tau_lim(:); q.tilt_max; ...
     q.wind_mean(:); q.wind_gust(:); q.wind_freq; a.kR(:); a.kW(:); ...
     double(a.drag_comp); q.kd];
end
