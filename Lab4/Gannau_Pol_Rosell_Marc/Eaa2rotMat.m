function [result] = Eaa2rotMat(axis,angle)
% axis must be a 3 component vector normalized, and the angle must be in degrees
I = eye(3);
uX = [0 -axis(3) axis(2);axis(3) 0 -axis(1);-axis(2) axis(1) 0];
result = I + (sind(angle)*uX) + (1-cosd(angle))*(uX^2);
end