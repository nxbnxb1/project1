function rj = dart_rejoin_update(rj, G, p, ob, cfg)
%DART_REJOIN_UPDATE Mode logic of the reference: TRACK the set path or REJOIN it.
%   TRACK   the MPC follows the set path Gamma from the projection of the
%           vehicle (deviation from Gamma is penalised).
%   REJOIN  an obstacle blocks Gamma ahead (or the vehicle is off Gamma):
%           the reference is redrawn as a short segment from the CURRENT
%           position to the rejoin point Gamma(s_r), followed by Gamma. The
%           MPC (with its obstacle constraints) turns it into a short
%           collision-free trajectory; the deviation from Gamma is not
%           penalised while rejoining. s_r is the earliest point of Gamma
%           behind the first blocked stretch (+ ref.m_rejoin), i.e. Gamma
%           is rejoined as early as possible.
%   A detour starts when a blocked run begins less than ref.L_trig ahead.
%   While rejoining, a blocked run that begins before s_r moves s_r
%   further; a run farther ahead is a NEW detour,
%   considered only once s_r is reached. At s_r (s0 >= s_r - ref.tol_s):
%   back to TRACK if the cross-track error is <= ref.e_on and Gamma ahead
%   is clear, otherwise a new detour (blocked) or a short rejoin towards a
%   point ref.L_min ahead. TRACK switches to such a short rejoin when the
%   cross-track error exceeds ref.e_off.
%   The short segment itself is planned by DART_DETOUR_PLAN (shortest
%   collision-free polyline in the horizontal plane to Gamma(s_r), rj.W);
%   with ref.plan = false it is the straight segment p -> Gamma(s_r).
%   rj.mode: 1 = TRACK, 2 = REJOIN (ref.mode = 'goal' uses 0, no path).
rf = cfg.ref;
if ~isfield(rj, 'W'), rj.W = zeros(3, 0); rj.n_plan = 0; end
[rj.s0, rj.e_lat] = dart_path_project(G, p, rj.s0 - rf.back, rj.s0 + rf.fwd);
if strcmp(rf.mode, 'track')
    rj.mode = 1;
    return
end
rj = mode_logic(rj, G, ob, rf, cfg);
if rj.mode ~= 2 || ~rf.plan
    rj.W = zeros(3, 0);
    return
end
% ---- the short segment: shortest collision-free polyline to Gamma(s_r),
%      kept (committed) while it stays valid; waypoints that can be cut
%      (the rest of the detour is visible from p) are dropped
q = dart_path_point(G, rj.s_r);
replan = isempty(rj.W) || norm(rj.W(:, end) - q) > 0.25;
if ~replan
    while size(rj.W, 2) > 1 && dart_detour_valid(p, rj.W(:, 2:end), ob, cfg)
        rj.W = rj.W(:, 2:end);
    end
    replan = ~dart_detour_valid(p, rj.W, ob, cfg);
end
if replan
    rj.W = dart_detour_plan(p, q, ob, cfg);
    rj.n_plan = rj.n_plan + 1;
end
end

function rj = mode_logic(rj, G, ob, rf, cfg)
if rj.mode == 2 && rj.s_r > rj.s0
    % rejoining: only a blocked run that begins before the planned rejoin
    % point invalidates it and moves it further; a run farther ahead is a
    % new detour, considered once Gamma has been rejoined
    [blk, s_end, s_beg] = dart_path_blocked(G, rj.s0, ob, cfg);
    if blk && s_beg <= rj.s_r
        rj.s_r = max(rj.s_r, min(s_end + rf.m_rejoin, G.L));
    end
    return
end
[blk, s_end, s_beg] = dart_path_blocked(G, rj.s0, ob, cfg);
if blk && s_beg - rj.s0 <= rf.L_trig          % new detour (blocked run close ahead)
    rj.s_r = min(s_end + rf.m_rejoin, G.L);
    rj.mode = 2;
    rj.n_rejoin = rj.n_rejoin + 1;
elseif rj.mode == 2                           % rejoin point reached
    if rj.e_lat <= rf.e_on
        rj.mode = 1;
    else
        rj.s_r = min(rj.s0 + rf.L_min, G.L);  % keep rejoining, just ahead
    end
elseif rj.e_lat > rf.e_off                    % pushed off Gamma while tracking
    rj.mode = 2;
    rj.s_r = min(rj.s0 + rf.L_min, G.L);
    rj.n_rejoin = rj.n_rejoin + 1;
else
    rj.mode = 1;
end
end
