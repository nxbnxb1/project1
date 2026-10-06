function pb = dart_posebuf_push(pb, t, p, q)
pb.k = mod(pb.k, pb.L) + 1;
pb.t(pb.k) = t;
pb.p(:, pb.k) = p;
pb.q(:, pb.k) = q;
end
