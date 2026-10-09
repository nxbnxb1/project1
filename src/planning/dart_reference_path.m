function [pr, vr, target] = dart_reference_path(p0, G, rj, N, dt, v_des, a_dec, L_look)
%DART_REFERENCE_PATH Horizon reference along the set path (TRACK) or along
%   the redrawn rejoin segment (REJOIN), see DART_REJOIN_UPDATE.
%   A carrot moves along the reference curve with speed
%   min(v_des, sqrt(2 a_dec s_remaining)) (s_remaining to the end of Gamma).
%     TRACK   curve = Gamma from the projection Gamma(s0)
%     REJOIN  curve = p0 -> detour waypoints rj.W -> Gamma(s_r), then Gamma
%             from s_r (rj.W empty: straight segment p0 -> Gamma(s_r))
%   target is the point the vehicle is heading for (yaw, head-on tilt):
%   the next detour waypoint, or Gamma(s0 + L_look) when tracking.
if rj.mode == 2
    q = dart_path_point(G, rj.s_r);
    if isfield(rj, 'W') && ~isempty(rj.W), Wd = rj.W; else, Wd = q; end
    Pc = [p0, Wd];                    % redrawn short segment (polyline)
    s_r = rj.s_r;
    target = Wd(:, 1);
else
    Pc = dart_path_point(G, rj.s0);
    s_r = rj.s0;
    target = dart_path_point(G, min(rj.s0 + L_look, G.L));
end
Pc = Pc(:, [true, sqrt(sum(diff(Pc, 1, 2).^2, 1)) > 1e-6]);   % no zero-length legs
seg = sqrt(sum(diff(Pc, 1, 2).^2, 1));
cs = [0, cumsum(seg)];
LA = cs(end);
rem = LA + G.L - s_r;                 % remaining length of the curve
pr = zeros(3, N); vr = zeros(3, N);
sg = 0;
for j = 1:N
    vm = min(v_des, sqrt(2 * a_dec * max(rem - sg, 0)));
    sg = min(sg + vm * dt, rem);
    vm = min(v_des, sqrt(2 * a_dec * max(rem - sg, 0)));
    if sg < LA
        k = find(cs <= sg, 1, 'last');
        k = min(k, numel(seg));
        u = (Pc(:, k + 1) - Pc(:, k)) / seg(k);
        pr(:, j) = Pc(:, k) + (sg - cs(k)) * u;
        vr(:, j) = vm * u;
    else
        [pj, tj] = dart_path_point(G, s_r + sg - LA);
        pr(:, j) = pj;
        vr(:, j) = vm * tj;
    end
end
end
