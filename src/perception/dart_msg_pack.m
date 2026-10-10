function msg = dart_msg_pack(t_c, t_a, det, cfg, grid)
%DART_MSG_PACK Fixed-length numeric perception message.
%   Layout: [valid t_c t_a n | n_max x (id npx rho cC(3) RC(xx xy xz yy yz zz) trunc)
%            | coarse free-space depth grid (DART_DEPTH_GRID), column-major]
%   If a frame has more than n_max detections the NEAREST n_max are kept
%   (a dropped detection would be counted as a miss by the tracker).
[nmax, len, gs] = dart_msg_size();
msg = zeros(len, 1);
if nargin < 5 || isempty(grid), grid = inf(gs); end
msg(4 + 13 * nmax + (1:prod(gs))) = grid(:);
if numel(det) > nmax
    [~, o] = sort(arrayfun(@(d) norm(d.cC), det));
    det = det(o(1:nmax));
end
n = min(numel(det), nmax);
msg(1:4) = [1; t_c; t_a; n];
for k = 1:n
    d = det(k);
    RC = d.RC;
    rec = [d.id; d.npx; d.rho; d.cC(:); RC(1,1); RC(1,2); RC(1,3); RC(2,2); RC(2,3); RC(3,3); double(d.trunc)];
    msg(4 + (k - 1) * 13 + (1:13)) = rec;
end
end
