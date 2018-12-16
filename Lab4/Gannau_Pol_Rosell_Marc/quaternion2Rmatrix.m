function [RMatrix] = quaternion2Rmatrix(q)
%Gieven an unit quaternion a rotation matrix is given back
RMatrix = [q(1).^2+q(2).^2-q(3).^2-q(4).^2 2*q(2)*q(3)-2*q(1)*q(4) 2*q(2)*q(4)+2*q(1)*q(3);
        2*q(2)*q(3)+2*q(1)*q(4) q(1).^2-q(2).^2+q(3).^2-q(4).^2 2*q(3)*q(4)-2*q(1)*q(2);
        2*q(2)*q(4)-2*q(1)*q(3) 2*q(3)*q(4)+2*q(1)*q(2) q(1).^2-q(2).^2-q(3).^2+q(4).^2];
end