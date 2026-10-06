function [F, Q] = dart_cv_model(dt, q)
%DART_CV_MODEL Constant-velocity transition and white-noise-acceleration
%   process covariance for x = [c; v] in R^6 (Eq. 19-21, 27).
I = eye(3);
F = [I, dt * I; zeros(3), I];
Q = q * [dt^3 / 3 * I, dt^2 / 2 * I; dt^2 / 2 * I, dt * I];
end
