function [hdr, det] = dart_msg_unpack(msg)
%DART_MSG_UNPACK Inverse of DART_MSG_PACK.
%   hdr = struct(valid, t_c, t_a, n);  det = struct array (id npx rho cC RC trunc)
hdr = struct('valid', msg(1) > 0.5, 't_c', msg(2), 't_a', msg(3), 'n', round(msg(4)));
det = struct('id', {}, 'npx', {}, 'rho', {}, 'cC', {}, 'RC', {}, 'trunc', {});
for k = 1:hdr.n
    r = msg(4 + (k - 1) * 13 + (1:13));
    RC = [r(7) r(8) r(9); r(8) r(10) r(11); r(9) r(11) r(12)];
    det(k) = struct('id', round(r(1)), 'npx', r(2), 'rho', r(3), 'cC', r(4:6), ...
        'RC', RC, 'trunc', r(13) > 0.5);
end
end
