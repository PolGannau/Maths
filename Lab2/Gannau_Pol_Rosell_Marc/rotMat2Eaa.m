function [Axis,Angle] = rotMat2Eaa (R)
%Given a Rotation Matrix, the function returns the euler axis and the euler
%angle
Axis = zeros(3,1);
t = R(1,1) + R(2,2) + R(3,3);
Angle = acos((t-1)/2);
uX = ((R-R')/(2*sind(Angle)));
Axis(1) = uX(3,2);
Axis(2) = uX(1,3);
Axis(3) = uX(2,1);
end