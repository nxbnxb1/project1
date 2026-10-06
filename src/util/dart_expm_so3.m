function R = dart_expm_so3(w)
%DART_EXPM_SO3 Rodrigues formula: rotation matrix of the rotation vector w.
th = norm(w);
if th < 1e-12
    R = eye(3) + dart_hat(w);
    return
end
K = dart_hat(w / th);
R = eye(3) + sin(th) * K + (1 - cos(th)) * (K * K);
end
