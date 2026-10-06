function x = dart_randn(rs, m, n)
%DART_RANDN Normal samples from a stream created by DART_RNG_CREATE.
if isobject(rs)
    x = randn(rs, m, n);
else
    x = randn(m, n);
end
end
