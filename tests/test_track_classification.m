function test_track_classification()
% Two-model track bank (Sec. 5.3): a stationary obstacle is classified
% static and keeps a small uncertainty while out of view (so it is not
% forgotten nearby); a crossing obstacle (0.6 m/s) is never classified static.
cfg = dart_default_config();
cfg.trk.q_acc = 0.05; cfg.trk.sigma_v0 = 1.0;     % dynamic-scenario prior (S2)
rs = dart_rng_create(3);
sig = 0.15;                                        % measurement std [m]
pb = dart_posebuf_init(100);
for t = 0:0.01:6
    pb = dart_posebuf_push(pb, t, [0; 0; 2], [1; 0; 0; 0]);
end
trk = dart_tracks_init(cfg);
c_s = [6; 1; 2];                                   % stationary obstacle (id 1)
c_m0 = [7; -1.5; 2]; v_m = [0; 0.6; 0];            % crossing obstacle  (id 2)
st = false(2, 0);
tt = 0.1:0.15:4.0;
for t_c = tt
    c_m = c_m0 + v_m * t_c;
    det = [meas(1, c_s, cfg, rs, sig), meas(2, c_m, cfg, rs, sig)];
    hdr = struct('valid', true, 't_c', t_c, 't_a', t_c + 0.08, 'n', 2);
    trk = dart_tracks_process_msg(trk, hdr, det, pb, t_c + 0.08, cfg);
    st(:, end + 1) = trk.static(1:2).';
end
assert(all(st(1, tt >= cfg.trk.T_static + 0.5)), 'stationary obstacle not classified static');
assert(~any(st(2, :)), 'crossing obstacle classified static');
ob = dart_tracks_now(trk, 4.1, cfg);
assert(norm(ob.v(:, 1)) < 0.1 && norm(ob.v(:, 2) - v_m) < 0.3, 'velocity estimates');
% 10 s later, out of view (vehicle turned around), 4.5 m away: the static
% track keeps a small sigma and is kept; the dynamic one is forgotten.
R_back = [-1 0 0; 0 -1 0; 0 0 1];
t = 14.1;
[~, P] = dart_track_predict(trk, 1, t, cfg);
assert(sqrt(dart_lmax_sym3(P(1:3, 1:3))) < 0.5, 'static track uncertainty grew too fast');
trk = dart_tracks_prune(trk, t, [0; 0; 2], R_back, cfg);
assert(trk.active(1), 'nearby static track was forgotten');
assert(~trk.active(2), 'stale dynamic track was not forgotten');
% ... and a static track is forgotten once it is far away and out of view
trk = dart_tracks_prune(trk, t, [-cfg.trk.forget_dist - 7; 0; 2], R_back, cfg);
assert(~trk.active(1), 'far static track was not forgotten');
end

function d = meas(id, c, cfg, rs, sig)
cB = c - [0; 0; 2];
cC = cfg.cam.R_BC.' * (cB - cfg.cam.p_BC) + sig * dart_randn(rs, 3, 1);
d = struct('id', id, 'npx', 50, 'rho', 0.5, 'cC', cC, 'RC', sig^2 * eye(3), 'trunc', false);
end
