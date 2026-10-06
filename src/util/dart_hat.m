function S = dart_hat(w) %#codegen
%DART_HAT Skew-symmetric matrix such that hat(a)*b = cross(a, b).
S = [0, -w(3), w(2); w(3), 0, -w(1); -w(2), w(1), 0];
end
