function [trk, info] = dart_tracks_process_msg(trk, hdr, det, pb, t_now, cfg)
%DART_TRACKS_PROCESS_MSG Delay-aware Kalman update with one perception message.
%
%   delay_comp = true  (DART, Eq. 12, 23-27):
%     y is formed with the pose estimate at the CAPTURE time t_c, and the
%     update is applied at t_c to the prior predicted from the last
%     posterior (exact under A4: no other update between t_upd and t_c).
%   delay_comp = false (naive baseline):
%     the stale image is interpreted with the CURRENT pose and treated as a
%     measurement at the arrival time.
q = cfg.trk.q_acc;
H = [eye(3), zeros(3)];
info = struct('n_upd', 0, 'n_new', 0, 'n_rej', 0);
if cfg.trk.delay_comp
    t_meas = hdr.t_c;
else
    t_meas = t_now;
end
[pw, Rw] = dart_posebuf_lookup(pb, t_meas);
R_IC = Rw * cfg.cam.R_BC;
for k = 1:numel(det)
    d = det(k);
    i = d.id;
    if i < 1 || i > numel(trk.active), continue, end
    cB = cfg.cam.p_BC + cfg.cam.R_BC * d.cC;
    y = pw + Rw * cB;                                     % Eq. 12
    Ry = R_IC * d.RC * R_IC.' ...
        + (cfg.est.sigma_p^2 + (cfg.est.sigma_att * norm(cB))^2) * eye(3);
    if ~trk.active(i) || trk.n_rej(i) >= cfg.trk.max_reject || t_meas < trk.t_upd(i)
        trk = init_track(trk, i, y, Ry, d.rho, t_meas, cfg);
        info.n_new = info.n_new + 1;
        continue
    end
    [xm, Pm] = dart_track_predict(trk, i, t_meas, q);       % prior at t_c
    nu = y - H * xm;
    S = H * Pm * H.' + Ry;
    if nu.' * (S \ nu) > cfg.trk.gate
        trk.n_rej(i) = trk.n_rej(i) + 1;
        trk.n_gate_rej = trk.n_gate_rej + 1;
        info.n_rej = info.n_rej + 1;
        continue
    end
    K = (Pm * H.') / S;                                       % Eq. 23
    IKH = eye(6) - K * H;
    trk.x(:, i) = xm + K * nu;                                % Eq. 24
    trk.P(:, :, i) = IKH * Pm * IKH.' + K * Ry * K.';         % Eq. 25 (Joseph)
    trk.t_upd(i) = t_meas;
    trk.n_upd(i) = trk.n_upd(i) + 1;
    trk.n_rej(i) = 0;
    if ~d.trunc
        a = cfg.trk.rho_alpha;
        trk.rho(i) = (1 - a) * trk.rho(i) + a * d.rho;
    else
        trk.rho(i) = max(trk.rho(i), d.rho);
    end
    info.n_upd = info.n_upd + 1;
end
end

function trk = init_track(trk, i, y, Ry, rho, t, cfg)
trk.active(i) = true;
trk.x(:, i) = [y; 0; 0; 0];
trk.P(:, :, i) = blkdiag(Ry, cfg.trk.sigma_v0^2 * eye(3));
trk.t_upd(i) = t;
trk.rho(i) = rho;
trk.n_upd(i) = 1;
trk.n_rej(i) = 0;
end
