function [result] = eAngles2rotM (phy, theta, psy)
%Given 3 angles in degrees the function devolves a rotation matrix
cpsy = cosd(psy);
spsy = sind(psy);
ctheta = cosd(theta);
stheta = sind(theta);
cphy = cosd(phy);
sphy = sind(phy);
result = [ctheta*cpsy (cpsy*stheta*sphy)-(cphy*spsy) (cpsy*cphy*stheta)+(spsy*sphy);
            cphy*spsy (spsy*stheta*sphy)+(cphy*cpsy) (spsy*stheta*cphy)-(cpsy*sphy);
            -stheta ctheta*sphy ctheta*cphy];
end