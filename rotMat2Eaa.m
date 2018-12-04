function [Axis,Angle] = rotMat2Eaa (R)
%Given a Rotation Matrix, the function returns the euler axis and the euler
%angle
Angle = acos((trace(R)-1)/2);
uX = R - R';
if sin(Angle) ~= 0
beta = (sin(Angle))*2;
uX = uX/(beta);
end
Axis = [uX(3,2);uX(1,3);uX(2,1)];
end