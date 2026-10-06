function msg = dart_msg_pack(t_c, t_a, det, cfg)
%DART_MSG_PACK Fixed-length numeric perception message.
%   Layout: [valid t_c t_a n | n_max x (id npx rho cC(3) RC(xx xy xz yy yz zz) trunc)]
nmax = dart_msg_size();
msg = zeros(4 + 13 * nmax, 1);
n = min(numel(det), nmax);
msg(1:4) = [1; t_c; t_a; n];
for k = 1:n
    d = det(k);
    RC = d.RC;
    rec = [d.id; d.npx; d.rho; d.cC(:); RC(1,1); RC(1,2); RC(1,3); RC(2,2); RC(2,3); RC(3,3); double(d.trunc)];
    msg(4 + (k - 1) * 13 + (1:13)) = rec;
end
end
