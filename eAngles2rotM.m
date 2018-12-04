function [result] = eAngles2rotM (phy, theta, psi)
%Given 3 angles in radians the function devolves a rotation matrix
cpsi = cos(psi);
spsi = sin(psi);
ctheta = cos(theta);
stheta = sin(theta);
cphy = cos(phy);
sphy = sin(phy);
result = [ctheta*cpsi (cpsi*stheta*sphy)-(cphy*spsi) (cpsi*cphy*stheta)+(spsi*sphy);
            cphy*spsi (spsi*stheta*sphy)+(cphy*cpsi) (spsi*stheta*cphy)-(cpsi*sphy);
            -stheta ctheta*sphy ctheta*cphy];
end