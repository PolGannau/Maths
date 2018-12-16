function [result] = rotVbyq(v,q)
%this function rotates a Vector by using Quaternion multiplications and
%returns a vector
%THE VECTOR MUST BE VERTICAL
%has to transforn the quaternion into a unit quaternion and then
%multiplicate the vector (that was passed into a quaternion) and the result
%is the quaternion W without the "0".
w = [0;v];
qw = multiplyQuat(multiplyQuat(q,w),[q(1);-q(2:4)]);
result = qw(2:4);
end