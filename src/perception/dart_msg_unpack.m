function [hdr, det, grid] = dart_msg_unpack(msg)
%DART_MSG_UNPACK Inverse of DART_MSG_PACK.
%   hdr = struct(valid, t_c, t_a, n);  det = struct array (id npx rho cC RC
%   trunc hz open_lo open_hi)
nr = 16;
hdr = struct('valid', msg(1) > 0.5, 't_c', msg(2), 't_a', msg(3), 'n', round(msg(4)));
det = struct('id', {}, 'npx', {}, 'rho', {}, 'cC', {}, 'RC', {}, 'trunc', {}, ...
    'hz', {}, 'open_lo', {}, 'open_hi', {});
for k = 1:hdr.n
    r = msg(4 + (k - 1) * nr + (1:nr));
    RC = [r(7) r(8) r(9); r(8) r(10) r(11); r(9) r(11) r(12)];
    det(k) = struct('id', round(r(1)), 'npx', r(2), 'rho', r(3), 'cC', r(4:6), ...
        'RC', RC, 'trunc', r(13) > 0.5, 'hz', r(14), 'open_lo', r(15) > 0.5, 'open_hi', r(16) > 0.5);
end
[nmax, ~, gs] = dart_msg_size();
grid = reshape(msg(4 + nr * nmax + (1:prod(gs))), gs);
end
