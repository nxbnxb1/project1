function f = dart_failure_info(res)
%DART_FAILURE_INFO Cause category of a failed run (for global failure analysis).
%   f.cls   'collision-untracked'  the obstacle hit was not covered by any
%                                  track (perception / association miss)
%           'collision-tracked'    it was tracked (estimate, prediction or
%                                  control / safety-layer failure)
%           'timeout-stuck'        < 2 m progress along the set path in the
%                                  last 10 s (deadlock / local minimum)
%           'timeout-slow'         still progressing when time ran out
%           'diverged', 'goal'
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
        if f.tracked == 1, f.cls = 'collision-tracked'; else, f.cls = 'collision-untracked'; end
    case 'timeout'
        if f.prog10 < 2, f.cls = 'timeout-stuck'; else, f.cls = 'timeout-slow'; end
end
end
