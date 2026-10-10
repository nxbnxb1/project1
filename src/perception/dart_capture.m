function [depth_hat, inst, depth_true] = dart_capture(cam, p, R_IB, cfg, world, t, rs)
%DART_CAPTURE One camera frame through the synthetic depth network.
%   The scene is ray-cast on the supersampled rays cam.sub from the TRUE
%   pose (p, R_IB) at time t and passed through DART_DEPTH_NETWORK.
%   depth_hat   1 x (W*H) network depth (what the vehicle receives)
%   inst        1 x (W*H) ground-truth object id at each pixel centre
%               (scoring and the oracle ablation only; 0 = background or
%               beyond R_max)
%   depth_true  1 x (W*H) true depth at each pixel centre (Inf beyond R_max)
[dS, iS] = dart_render_world(cam.sub, p, R_IB, cfg, world, t);
depth_hat = dart_depth_network(dS, cfg, rs);
ss = cam.ss;
c = ceil(ss / 2);
rows = (0:cam.H - 1) * ss + c;
cols = (0:cam.W - 1) * ss + c;
DS = reshape(dS, cam.H * ss, cam.W * ss);
IS = reshape(iS, cam.H * ss, cam.W * ss);
depth_true = reshape(DS(rows, cols), 1, []);
inst = reshape(IS(rows, cols), 1, []);
far = ~(depth_true <= cfg.cam.R_max);
depth_true(far) = Inf;
inst(far) = 0;
end
