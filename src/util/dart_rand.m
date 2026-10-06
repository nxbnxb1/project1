function x = dart_rand(rs, m, n)
%DART_RAND Uniform samples from a stream created by DART_RNG_CREATE.
if isobject(rs)
    x = rand(rs, m, n);
else
    x = rand(m, n);
end
end
