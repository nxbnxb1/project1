function test_track_memory()
% Static landmarks (method §6): repeated measurements of a static obstacle
% shrink its covariance and it keeps zero velocity; with the default
% forget_dist = 0 a track is forgotten as soon as it leaves the view, with
% forget_dist > 0 it is kept out of view while close. A detection far from
% every track starts a new one (no identities).
cfg = dart_default_config();
rs = dart_rng_create(3);
sig = 0.15;
pb = dart_posebuf_init(100);
for t = 0:0.01:4
    pb = dart_posebuf_push(pb, t, [0; 0; 2], [1; 0; 0; 0]);
end
trk = dart_tracks_init(cfg);
c_s = [6; 1; 2];
for t_c = 0.1:0.15:2.0
    det = meas(c_s, cfg, rs, sig);
    hdr = struct('valid', true, 't_c', t_c, 't_a', t_c + 0.08, 'n', 1);
    trk = dart_tracks_process_msg(trk, hdr, det, pb, t_c + 0.08, cfg);
end
assert(nnz(trk.active) == 1, 'one obstacle, one track');
i = find(trk.active);
[x, P] = dart_track_predict(trk, i, 3, cfg);
assert(norm(x(4:6)) == 0, 'static landmark has zero velocity');
assert(norm(x(1:3) - c_s) < 0.15 && sqrt(max(eig(P(1:3, 1:3)))) < 0.1, 'estimate / covariance');
% a second obstacle 3 m away is a new track
det = meas([6; -2; 2], cfg, rs, sig);
trk2 = dart_tracks_process_msg(trk, struct('valid', true, 't_c', 2.1, 't_a', 2.2, 'n', 1), det, pb, 2.2, cfg);
assert(nnz(trk2.active) == 2, 'a far detection must start a new track');
% out of view (vehicle turned around): forgotten at once by default ...
R_back = [-1 0 0; 0 -1 0; 0 0 1];
t1 = dart_tracks_prune(trk, 3, [0; 0; 2], R_back, cfg);
assert(~any(t1.active), 'default: no memory out of view');
% ... still in view: kept
t2 = dart_tracks_prune(trk, 3, [0; 0; 2], eye(3), cfg);
assert(t2.active(i), 'a track in view must be kept');
% ... with a memory range it is kept while close, forgotten when far
cfg.trk.forget_dist = 10;
t3 = dart_tracks_prune(trk, 3, [0; 0; 2], R_back, cfg);
assert(t3.active(i), 'memory: nearby track kept');
t4 = dart_tracks_prune(trk, 3, [-12; 0; 2], R_back, cfg);
assert(~t4.active(i), 'memory: far track forgotten');
end

function d = meas(c, cfg, rs, sig)
cB = c - [0; 0; 2];
cC = cfg.cam.R_BC.' * (cB - cfg.cam.p_BC) + sig * dart_randn(rs, 3, 1);
d = struct('id', 1, 'npx', 50, 'rho', 0.5, 'cC', cC, 'RC', sig^2 * eye(3), 'trunc', false);
end
