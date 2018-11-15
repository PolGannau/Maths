function [resultQuat] = multiplyQuat(q,p)
q0 = q(1);
p0 = p(1);
qVec = q(2:end);
pVec = p(2:end);
resultQuat = zeros(4,1);
resultQuat(1) = q0*p0 - qVec'*pVec;
resultQuat(2:end) = q0*pVec + p0*qVec + cross(qVec,pVec);
end