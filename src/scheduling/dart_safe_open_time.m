function [T, M] = dart_safe_open_time(dc, vc, d_s, a_b, a_plus)
%DART_SAFE_OPEN_TIME Longest open-loop interval that still allows a stop
%   (revised Eq. 38-39, Appendix A).
%
%   During an interval T without visual correction the closing speed may
%   grow with a_plus (worst case). Safety requires
%     vc*T + a_plus*T^2/2 + (vc + a_plus*T)^2/(2 a_b) <= dc - d_s,
%   whose positive root is
%     T* = (-vc*k + sqrt(vc^2 k^2 + 2 a_plus k M)) / (a_plus k),
%     k  = 1 + a_plus/a_b,   M = dc - d_s - vc^2/(2 a_b).
%   For a_plus -> 0 it reduces to M/vc (original Eq. 39); unlike Eq. 39 it is
%   finite and well defined for vc = 0. M < 0 returns T = 0 (emergency).
M = dc - d_s - vc.^2 / (2 * a_b);
if a_plus > 0
    k = 1 + a_plus / a_b;
    T = (-vc * k + sqrt((vc * k).^2 + 2 * a_plus * k * max(M, 0))) / (a_plus * k);
else
    T = max(M, 0) ./ max(vc, 1e-6);
    T(vc <= 1e-6 & M > 0) = inf;          % not closing and no acceleration
end
T(M <= 0) = 0;
end
