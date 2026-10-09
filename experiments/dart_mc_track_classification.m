function T = dart_mc_track_classification(nseed)
%DART_MC_TRACK_CLASSIFICATION Monte-Carlo check of the static/dynamic track
%   classification (method §6). A stationary obstacle and a crossing
%   obstacle (speed vm) are observed by a hovering camera every 0.15 s for
%   6 s with isotropic measurement noise sig. Reported per case:
%     mover_static  runs in which the moving obstacle was ever classified static
%     max_dur, max_err  longest misclassification [s] and largest position
%                   error of the reported estimate meanwhile [m]
%     static_found  runs in which the stationary obstacle is static at the end
%     t50, t90      median / 90th percentile of the first static time [s]
%   prior 'S2' uses the dynamic-scenario CV prior (q_acc 0.05, sigma_v0 1).
%   The classification is studied in isolation: the synthetic detections
%   carry the true obstacle id and the oracle association (slot = id) is
%   used, as in the run quoted in the method (§6, commit faf360e). The
%   closed loop associates without identities (method §6, R13).
if nargin < 1, nseed = 100; end
cases = {0.6, 0.15, 'S2'; 0.4, 0.15, 'S2'; 0.3, 0.15, 'S2'; ...
         0.6, 0.30, 'S2'; 0.4, 0.30, 'S2'; 0.4, 0.15, 'S1'};
T = struct('vm', {}, 'sig', {}, 'prior', {}, 'mover_static', {}, 'max_dur', {}, ...
    'max_err', {}, 'static_found', {}, 't50', {}, 't90', {});
fprintf('| v mover [m/s] | sigma [m] | prior | mover ever static | max dur [s] | max err [m] | static found | t50 [s] | t90 [s] |\n|---|---|---|---|---|---|---|---|---|\n');
for c = 1:size(cases, 1)
    [vm, sig, prior] = cases{c, :};
    r = one_case(nseed, vm, sig, prior);
    T(end + 1) = r; %#ok<AGROW>
    fprintf('| %.1f | %.2f | %s | %d/%d | %.2f | %.2f | %d/%d | %.2f | %.2f |\n', vm, sig, prior, ...
        r.mover_static, nseed, r.max_dur, r.max_err, r.static_found, nseed, r.t50, r.t90);
end
end

function r = one_case(nseed, vm, sig, prior)
cfg = dart_default_config();
cfg.seg.oracle = true; cfg.trk.oracle_assoc = true;   % slot = obstacle id (see header)
if strcmp(prior, 'S2')
    cfg.trk.q_acc = 0.05; cfg.trk.sigma_v0 = 1.0;
end
pb = dart_posebuf_init(100);
for t = 0:0.01:6.2
    pb = dart_posebuf_push(pb, t, [0; 0; 2], [1; 0; 0; 0]);
end
c_s = [6; 1; 2]; c_m0 = [7; -1.5; 2]; v_m = [0; vm; 0];
tt = 0.1:0.15:6;
mis = 0; found = 0; t_first = inf(1, nseed); dur = 0; err = 0;
for s = 1:nseed
    rs = dart_rng_create(s);
    trk = dart_tracks_init(cfg);
    st = false(2, numel(tt));
    for k = 1:numel(tt)
        t_c = tt(k);
        det = [meas(1, c_s, cfg, rs, sig), meas(2, c_m0 + v_m * t_c, cfg, rs, sig)];
        hdr = struct('valid', true, 't_c', t_c, 't_a', t_c + 0.08, 'n', 2);
        trk = dart_tracks_process_msg(trk, hdr, det, pb, t_c + 0.08, cfg);
        st(:, k) = trk.static(1:2).';
        if trk.static(2)
            ob = dart_tracks_now(trk, t_c + 0.08, cfg);
            err = max(err, norm(ob.c(:, 2) - (c_m0 + v_m * (t_c + 0.08))));
        end
    end
    if any(st(2, :))
        mis = mis + 1;
        d = diff([0, st(2, :), 0]);
        dur = max(dur, max(find(d < 0) - find(d > 0)) * 0.15);
    end
    found = found + st(1, end);
    k = find(st(1, :), 1);
    if ~isempty(k), t_first(s) = tt(k); end
end
ts = sort(t_first);
r = struct('vm', vm, 'sig', sig, 'prior', prior, 'mover_static', mis, 'max_dur', dur, ...
    'max_err', err, 'static_found', found, 't50', ts(ceil(0.5 * nseed)), 't90', ts(ceil(0.9 * nseed)));
end

function d = meas(id, c, cfg, rs, sig)
cB = c - [0; 0; 2];
cC = cfg.cam.R_BC.' * (cB - cfg.cam.p_BC) + sig * dart_randn(rs, 3, 1);
d = struct('id', id, 'npx', 50, 'rho', 0.5, 'cC', cC, 'RC', sig^2 * eye(3), 'trunc', false);
end
