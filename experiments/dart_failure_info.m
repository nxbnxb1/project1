function f = dart_failure_info(res)
%DART_FAILURE_INFO Cause category of a failed run (for global failure analysis).
%   f.cls   'collision-untracked'  the obstacle hit was not covered by any
%                                  track (perception / association miss)
%           'collision-tracked'    it was tracked (estimate, prediction or
%                                  control / safety-layer failure)
%           'stuck'                no progress of sim.stuck_dist along the
%                                  set path for sim.stuck_window seconds
%                                  (deadlock / local minimum; there is no
%                                  time limit, the time to the goal is measured)
%           'collision'            unclassified (Simulink engine: no end-state row)
%           'diverged', 'goal', 'cap' (compute guard), 'timeout' (finite sim.t_max, tests)
%   "Tracked" means that some track's sphere comes within 1 m of the TRUE
%   surface of the obstacle hit (tracks carry no identity); "in FOV" is
%   evaluated at the obstacle's centre.
%   f.shape (sphere | box | cylinder), f.dyn (obstacle moving), f.infov,
%   f.mode (reference mode at the end: 0 goal, 1 track, 2 rejoin),
%   f.speed (|v| at the end), f.closing, f.static (matched track static),
%   f.prog10 (progress in the last 10 s), f.layout (SR worlds), f.v_des.
L = res.log;
w = res.world;
nm = dart_diag_names();
D = @(name) L.dg(strcmp(nm, name), :);
shapes = {'sphere', 'box', 'cylinder'};
f = struct('cls', res.outcome, 'shape', '-', 'dyn', NaN, 'tracked', NaN, 'infov', NaN, ...
    'mode', NaN, 'speed', NaN, 'closing', NaN, 'static', NaN, 'prog10', NaN, ...
    'layout', '-', 'v_des', res.cfg.ref.v_des);
if isfield(w, 'meta'), f.layout = w.meta.layout; end
s = D('s_prog');
k10 = find(L.t >= L.t(end) - 10, 1);
f.prog10 = s(end) - s(k10);
if isfield(res, 'ref_mode_end'), f.mode = res.ref_mode_end; end
if isfield(res, 'fail_row')
    r = res.fail_row;
    i = r(1);
    if i > 0
        typ = 1; if isfield(w, 'type'), typ = w.type(i); end
        f.shape = shapes{typ};
        f.dyn = double(any(w.v(:, i) ~= 0));
    end
    f.tracked = r(3); f.infov = r(7); f.speed = r(8); f.closing = r(9); f.static = r(10);
end
switch res.outcome
    case 'collision'
        if f.tracked == 1
            f.cls = 'collision-tracked';
        elseif f.tracked == 0
            f.cls = 'collision-untracked';
        else
            f.cls = 'collision';           % no end-state row (Simulink engine)
        end
    case 'stuck'
        f.cls = 'stuck';
end
end
