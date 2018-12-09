function [resultQuat] = multiplyQuat(q,p)
%q y p deben ser vecotres columna
q0 = q(1);
p0 = p(1);
qVec = q(2:4);
pVec = p(2:4);
resultQuat = zeros(4,1);
resultQuat(1) = q0*p0 - qVec'*pVec;
resultQuat(2:end) = q0*pVec + p0*qVec + cross(qVec,pVec);
end