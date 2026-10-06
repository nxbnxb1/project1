function test_delay_compensation()
% Updating at the capture time with the buffered pose removes the
% e_delay ~ v * tau_p error (Eq. 15-17) of the naive update.
cfg = dart_default_config();
cfg.est.sigma_p = 1e-3; cfg.est.sigma_att = 1e-5;
c_true = [12; 0.5; 2];
v = [4; 0; 0];
tau = 0.15;
t_c = 1.0; t_a = t_c + tau;
err = zeros(1, 2);
for mode = 1:2
    cfg.trk.delay_comp = (mode == 1);
    pb = dart_posebuf_init(100);
    for t = 0:0.01:t_a + 1e-9
        pb = dart_posebuf_push(pb, t, [0; 0; 2] + v * t, [1; 0; 0; 0]);
    end
    % noise-free measurement taken at the true capture pose
    p_c = [0; 0; 2] + v * t_c;
    cB = c_true - p_c;
    cC = cfg.cam.R_BC.' * (cB - cfg.cam.p_BC);
    det = struct('id', 1, 'npx', 50, 'rho', 0.5, 'cC', cC, 'RC', 0.01 * eye(3), 'trunc', false);
    hdr = struct('valid', true, 't_c', t_c, 't_a', t_a, 'n', 1);
    trk = dart_tracks_init(cfg);
    trk = dart_tracks_process_msg(trk, hdr, det, pb, t_a, cfg);
    ob = dart_tracks_now(trk, t_a, cfg);
    err(mode) = norm(ob.c(:, 1) - c_true);
end
assert(err(1) < 0.02, 'delay-compensated error too large');
assert(abs(err(2) - norm(v) * tau) < 0.05, 'naive error should be ~ v*tau');
end
