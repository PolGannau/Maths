function [resultQuat] = quatFromAngleDivided (vector, angle)
%The vector should have 3 components, and the angle is only accepted in
%degrees
resultQuat = [cosd(angle/2);sind(angle/2)*vector];
end