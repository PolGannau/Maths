function [resultQuat] = conjugateQuaternion (quat)
%A quaterion must be introduced
resultQuat = zeros(4,1);
resultQuat = quat;
resultQuat(2:end) = -1 * quat(2:end);
end