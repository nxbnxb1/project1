function perc = dart_perception_init(cfg, world, seed)
%DART_PERCEPTION_INIT State of the simulated camera + depth-AI pipeline.
%   A single inference engine (assumption A4): at most one frame in flight.
perc.cfg = cfg;
perc.world = world;
perc.cam = dart_camera_rays(cfg);
perc.rs = dart_rng_create(2000 + seed);
perc.busy = false;
perc.t_c = -inf;
perc.t_a = -inf;
[~, len] = dart_msg_size();
perc.pending = zeros(len, 1);
perc.n_capt = 0;
perc.e_gpu = 0;          % accelerator energy [J]
perc.t_busy = 0;         % accumulated inference time [s]
perc.last_tau = 0;
end
