function [p, R, ok] = dart_posebuf_lookup(pb, t)
%DART_POSEBUF_LOOKUP Estimated pose at (past) time t, linear / nlerp
%   interpolation between the two bracketing samples.
valid = isfinite(pb.t);
ts = pb.t(valid); ps = pb.p(:, valid); qs = pb.q(:, valid);
[ts, o] = sort(ts); ps = ps(:, o); qs = qs(:, o);
ok = ~isempty(ts) && t >= ts(1) - 1e-9;
if isempty(ts)
    p = zeros(3, 1); R = eye(3); ok = false; return
end
if t <= ts(1)
    p = ps(:, 1); R = dart_quat2rotm(qs(:, 1)); return
end
if t >= ts(end)
    p = ps(:, end); R = dart_quat2rotm(qs(:, end)); return
end
j = find(ts <= t, 1, 'last');
a = (t - ts(j)) / max(ts(j + 1) - ts(j), 1e-12);
p = (1 - a) * ps(:, j) + a * ps(:, j + 1);
q1 = qs(:, j); q2 = qs(:, j + 1);
if q1.' * q2 < 0, q2 = -q2; end
q = (1 - a) * q1 + a * q2;
R = dart_quat2rotm(q / norm(q));
end
