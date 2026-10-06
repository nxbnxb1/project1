function pb = dart_posebuf_init(L)
%DART_POSEBUF_INIT Ring buffer of estimated poses (needed by Eq. 12).
pb.t = -inf(1, L);
pb.p = zeros(3, L);
pb.q = repmat([1; 0; 0; 0], 1, L);
pb.k = 0;
pb.L = L;
end
