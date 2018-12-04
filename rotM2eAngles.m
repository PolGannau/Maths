function [angleSet1,angleSet2] = rotM2eAngles(rotationMatrix)
%Given a rotation matrix, the function gives two sets of three diffrent
%angles in degrees, as Psi, Theta and Phy in this specific order. THERE ARE
%TWO SETS BECAUSE THERE ARE TWO CONFIGURATIONS OF ANGLES THAT GIVE AN
%SPECIFIC ROTATION MATRIX
angleSet1 = zeros(3,1);
angleSet2 = zeros(3,1);
theta1 = asin(-rotationMatrix(3,1));
theta2 = pi - theta1;
angleSet1(1) = atan2((rotationMatrix(3,2)/cos(theta1)),(rotationMatrix(3,3)/cos(theta1)));
angleSet2(1) = atan2((rotationMatrix(3,2)/cos(theta2)),(rotationMatrix(3,3)/cos(theta2)));
angleSet1(2) = theta1;
angleSet2(2) = theta2;
angleSet1(3) = -atan2((rotationMatrix(2,1)/cos(theta1)),(rotationMatrix(1,1)/cos(theta1)));
angleSet2(3) = -atan2((rotationMatrix(2,1)/cos(theta2)),(rotationMatrix(1,1)/cos(theta2)));
end