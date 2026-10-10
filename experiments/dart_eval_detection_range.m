function R = dart_eval_detection_range(cfg, radii, dists, nrep)
%DART_EVAL_DETECTION_RANGE Detection probability and range bias of the
%   simulated camera + depth network + segmentation + sphere extraction
%   for single obstacles at known distance (calibration of the perception
%   limits; the obstacle is placed in front of the camera at a random
%   bearing within +-30 deg).
%
%   radii  pole radii [m] (vertical cylinders from the ground to 6 m);
%          a negative value -r means a floating sphere of radius r
%          (e.g. a tree canopy) centred at camera height
%   dists  distances from the camera to the obstacle SURFACE [m]
%   R.p_det(i,j)   fraction of frames with a detection of the obstacle
%   R.ratio(i,j)   median of (estimated surface distance / true surface
%                  distance) over detected frames; > 1: reads too far
%   R.ratio90(i,j) 90th percentile of that ratio
if nargin < 1 || isempty(cfg), cfg = dart_default_config(); end
if nargin < 2 || isempty(radii), radii = [0.05 0.08 0.12 0.2 0.3 -1.0 -2.0]; end
if nargin < 3 || isempty(dists), dists = [2 3 4 5 6 8 10 12 14]; end
if nargin < 4 || isempty(nrep), nrep = 30; end
cam = dart_camera_rays(cfg);
rs = dart_rng_create(77);
p = [0; 0; 2];
R.radii = radii; R.dists = dists;
R.p_det = zeros(numel(radii), numel(dists));
R.ratio = nan(numel(radii), numel(dists));
R.ratio90 = nan(numel(radii), numel(dists));
for i = 1:numel(radii)
    for j = 1:numel(dists)
        r = abs(radii(i));
        ratios = [];
        ndet = 0;
        for k = 1:nrep
            b = (dart_rand(rs, 1, 1) - 0.5) * 60 * pi / 180;
            psi = (dart_rand(rs, 1, 1) - 0.5) * 0.2;
            Rb = [cos(psi) -sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1];
            dc = dists(j) + r;                        % centre distance
            c = p + dc * [cos(b + psi); sin(b + psi); 0];
            if radii(i) > 0
                w = struct('c0', [c(1:2); 3], 'v', [0; 0; 0], 'rho', sqrt(r^2 + 9), ...
                    'type', 3, 'dim', [r; 3; 0], 'yaw', 0, 'obj', 1);
            else
                w = struct('c0', c, 'v', [0; 0; 0], 'rho', r, 'type', 1, 'dim', [r; 0; 0], ...
                    'yaw', 0, 'obj', 1);
            end
            [dh, inst] = dart_capture(cam, p, Rb, cfg, w, 0, rs);
            [lab, n] = dart_segment_depth(dh, cam, cfg);
            if n == 0, continue, end
            det = dart_extract_obstacles(dh, lab, cam, cfg);
            if isempty(det), continue, end
            R_IC = Rb * cfg.cam.R_BC; o = p + Rb * cfg.cam.p_BC;
            best = inf; est = NaN;
            for q = 1:numel(det)
                cq = o + R_IC * det(q).cC;
                eh = norm(cq(1:2) - c(1:2));          % horizontal offset to the axis / centre
                if eh < best
                    best = eh;
                    est = max(norm(cq(1:2) - o(1:2)) - det(q).rho, 0.01);
                end
            end
            truth = norm(c(1:2) - o(1:2)) - r;
            % detected: a sphere whose surface comes within 2 m of the true
            % surface along the line of sight (else it is another artefact)
            if best < r + 0.5 + 0.25 * dc
                ndet = ndet + 1;
                ratios(end + 1) = est / truth; %#ok<AGROW>
            end
        end
        R.p_det(i, j) = ndet / nrep;
        if ~isempty(ratios)
            s = sort(ratios);
            R.ratio(i, j) = s(max(1, round(0.5 * numel(s))));
            R.ratio90(i, j) = s(max(1, round(0.9 * numel(s))));
        end
    end
end
fprintf('detection probability (rows: pole radius [m], negative = sphere; cols: surface distance [m])\n');
fprintf('%8s', 'r \\ d'); fprintf('%7g', dists); fprintf('\n');
for i = 1:numel(radii)
    fprintf('%8g', radii(i)); fprintf('%7.2f', R.p_det(i, :)); fprintf('\n');
end
fprintf('median ratio estimated / true surface distance\n');
for i = 1:numel(radii)
    fprintf('%8g', radii(i)); fprintf('%7.2f', R.ratio(i, :)); fprintf('\n');
end
fprintf('90th percentile of the ratio\n');
for i = 1:numel(radii)
    fprintf('%8g', radii(i)); fprintf('%7.2f', R.ratio90(i, :)); fprintf('\n');
end
end
