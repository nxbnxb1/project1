function S = dart_eval_segmentation(scenarios, seeds, nframes)
%DART_EVAL_SEGMENTATION Quality of the UAV's own segmentation (method §12.3).
%   S = DART_EVAL_SEGMENTATION({'S1','S2','S3'}, 100:149, 150) renders
%   nframes random frames (random pose, heading and time) of the given
%   scenarios/seeds - the seeds 100-149 are not used by the closed-loop
%   evaluation - segments the simulated network output with
%   DART_SEGMENT_DEPTH and scores it against the ray-caster labels (used
%   ONLY here, for scoring):
%     miss   an object with >= min_px valid pixels has no segment of its own
%     split  >= 2 segments (>= min_px each) whose majority is the object
%     merge  a segment with >= max(min_px, 10 %) pixels of a second object
%   and compares the extracted spheres (DART_EXTRACT_OBSTACLES) of the
%   segmentation with those of the oracle labels: centre error of the
%   detection nearest to the true centre (spheres only), radius error.
if nargin < 1, scenarios = {'S1', 'S2', 'S3'}; end
if nargin < 2, seeds = 100:149; end
if nargin < 3, nframes = 150; end
rs = dart_rng_create(11);
S = struct('nobj', 0, 'miss', 0, 'miss_small', 0, 'split', 0, 'merge', 0, 'ncomp', 0, ...
    'eo', [], 'es', [], 'ro', [], 'rsg', [], 'cover', [], 'cover_inf', []);
for f = 1:nframes
    sname = scenarios{mod(f - 1, numel(scenarios)) + 1};
    seed = seeds(1 + mod(floor((f - 1) / numel(scenarios)), numel(seeds)));
    cfg = dart_apply_variant(dart_default_config(), 'E_DART');
    [w, cfg] = dart_scenario(sname, seed, cfg);
    cam = dart_camera_rays(cfg);
    t = 8 * dart_rand(rs, 1, 1);
    for tries = 1:50
        L = max(w.path(1, :));
        p = [L * dart_rand(rs, 1, 1); 4 * dart_rand(rs, 1, 1) - 2; 1.5 + dart_rand(rs, 1, 1)];
        if min(dart_world_sdf(w, p, t)) > 0.5, break, end
    end
    psi = (dart_rand(rs, 1, 1) - 0.5) * 0.7;
    R = [cos(psi) -sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1];
    [depth, inst] = dart_render_world(cam, p, R, cfg, w, t);
    dh = dart_depth_network(depth, cfg, rs);
    [lab, n] = dart_segment_depth(dh, cam, cfg);
    S.ncomp = S.ncomp + n;
    deto = dart_extract_obstacles(dh, inst, cam, cfg);
    dets = dart_extract_obstacles(dh, lab, cam, cfg);
    R_IC = R * cfg.cam.R_BC; o = p + R * cfg.cam.p_BC;
    ids = unique(inst(inst > 0 & isfinite(dh)));
    for j = ids(:).'
        px = inst == j & isfinite(dh);
        if nnz(px) < cfg.cam.min_px, continue, end
        S.nobj = S.nobj + 1;
        Lj = lab(px); Lj = Lj(Lj > 0);
        own = [];
        for c = unique(Lj)
            if mode(inst(lab == c)) == j && nnz(lab == c) >= cfg.cam.min_px, own(end + 1) = c; end %#ok<AGROW>
        end
        if isempty(own)
            S.miss = S.miss + 1;
            S.miss_small = S.miss_small + (nnz(px) <= 5);
            continue
        end
        S.split = S.split + (numel(own) > 1);
        % covering: fraction of the object's visible surface points inside
        % the spheres extracted from its own segments
        k = find(px);
        X = o + R_IC * (cam.dirC(:, k) .* (depth(k) ./ cam.cosz(k)));
        D = dets(ismember([dets.id], own));
        inside = false(1, size(X, 2)); inside2 = inside;
        for q = 1:numel(D)
            dq = sqrt(sum((X - (o + R_IC * D(q).cC)).^2, 1));
            inside = inside | dq <= D(q).rho;
            % with the safety layer's inflation beta_s * sigma of the measurement
            inside2 = inside2 | dq <= D(q).rho + cfg.mpc.beta_s * sqrt(max(eig(D(q).RC)));
        end
        S.cover(end + 1) = mean(inside);
        S.cover_inf(end + 1) = mean(inside2);
        prim = find(w.obj == j);
        if numel(prim) == 1 && w.type(prim) == 1        % sphere: centre / radius error
            ct = w.c0(:, prim) + w.v(:, prim) * t;
            e = arrayfun(@(d) norm(o + R_IC * d.cC - ct), D);
            [S.es(end + 1), q] = min(e);
            S.rsg(end + 1) = D(q).rho - w.dim(1, prim);
            Do = deto([deto.id] == j);
            if ~isempty(Do)
                [S.eo(end + 1), q] = min(arrayfun(@(d) norm(o + R_IC * d.cC - ct), Do));
                S.ro(end + 1) = Do(q).rho - w.dim(1, prim);
            end
        end
    end
    for c = 1:n
        m = inst(lab == c);
        u = unique(m); cnt = arrayfun(@(x) nnz(m == x), u);
        if numel(u) > 1
            cs = sort(cnt, 'descend');
            S.merge = S.merge + (cs(2) >= max(cfg.cam.min_px, 0.1 * numel(m)));
        end
    end
end
q = @(x, p) quant(x, p);
fprintf('%s seeds %d-%d, %d frames: objects %d, segments %d\n', strjoin(scenarios, '/'), seeds(1), seeds(end), ...
    nframes, S.nobj, S.ncomp);
fprintf('  miss %d (%.1f%%; %d with <= 5 px)  split %d (%.1f%%)  merge %d\n', S.miss, 100 * S.miss / S.nobj, ...
    S.miss_small, S.split, 100 * S.split / S.nobj, S.merge);
fprintf('  covered surface fraction: median %.2f, 10th pct %.2f | with beta_s*sigma inflation: median %.2f, 10th pct %.2f\n', ...
    q(S.cover, 0.5), q(S.cover, 0.1), q(S.cover_inf, 0.5), q(S.cover_inf, 0.1));
if ~isempty(S.es)
    fprintf('  sphere centre error: segmentation median %.2f p95 %.2f | oracle labels median %.2f p95 %.2f [m]\n', ...
        q(S.es, 0.5), q(S.es, 0.95), q(S.eo, 0.5), q(S.eo, 0.95));
    fprintf('  sphere radius error: segmentation median %+.2f | oracle labels median %+.2f [m]\n', q(S.rsg, 0.5), q(S.ro, 0.5));
end
end

function v = quant(x, p)
x = sort(x(isfinite(x)));
if isempty(x), v = NaN; return, end
v = x(max(1, round(p * numel(x))));
end
