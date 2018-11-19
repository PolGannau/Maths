function [result] = Eaa2rotMat(axis,angle)
% axis must be a 3 component vector, and the angle must be in degrees
result = zeros(3);
I = eye(3);
uX = zeros(3);
uX = [0 -axis(3,1) axis(2,1);axis(3,1) 0 -axis(1,1);-axis(2,1) axis(1,1) 0];
result = I + sind(angle)*uX + (1-cosd(angle))*uX^2;
end