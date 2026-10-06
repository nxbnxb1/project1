function R = dart_quat2rotm(q) %#codegen
%DART_QUAT2ROTM Rotation matrix (body -> inertial) of a unit quaternion [w x y z].
q = q / sqrt(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2);
w = q(1); x = q(2); y = q(3); z = q(4);
R = [1 - 2*(y*y + z*z), 2*(x*y - w*z),     2*(x*z + w*y);
     2*(x*y + w*z),     1 - 2*(x*x + z*z), 2*(y*z - w*x);
     2*(x*z - w*y),     2*(y*z + w*x),     1 - 2*(x*x + y*y)];
end
