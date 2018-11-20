function [result] = eAngles2rotM (phy, theta, psy)
%Given 3 angles in degrees the function devolves a rotation matrix
cpsy = cosd(psy);
spsy = sind(psy);
ctheta = cosd(theta);
stheta = sind(theta);
cphy = cosd(phy);
sphy = sind(phy);
result = [ctheta*cpsy]
end