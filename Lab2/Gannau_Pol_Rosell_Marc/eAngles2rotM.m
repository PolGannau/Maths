function [result] = eAngles2rotM (phy, theta, psi)
%Given 3 angles in degrees the function devolves a rotation matrix
cpsi = cosd(psi);
spsi = sind(psi);
ctheta = cosd(theta);
stheta = sind(theta);
cphy = cosd(phy);
sphy = sind(phy);
result = [ctheta*cpsi (cpsi*stheta*sphy)-(cphy*spsi) (cpsi*cphy*stheta)+(spsi*sphy);
            cphy*spsi (spsi*stheta*sphy)+(cphy*cpsi) (spsi*stheta*cphy)-(cpsi*sphy);
            -stheta ctheta*sphy ctheta*cphy];
end