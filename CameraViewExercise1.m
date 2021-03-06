f1P1 = [0;-0.5977;1.2817];
f1P2 = [-1;1.0261;2.8191];

f2P3 = [0;-0.2724;-1.7821];

wDwf1 = [0;4;1];
wDwf2 = [1;7;4];

theta = 30;
csth = cosd(theta);
snth = sind(theta);
f1Rw = [1 0 0;0 csth snth;0 -snth csth];

phy = -25;
csphy = cosd(phy);
snphy = sind(phy);
f2Rw = [1 0 0;0 csphy snphy;0 -snphy csphy];

f = 1/55;

wDwc = [6;3;0];

R1 = eAngles2rotM(pi/2,0,-pi/2);
R2 = Eaa2rotM([0;0;1],(-pi/20));
R3 = Eaa2rotM([0;1;0],0.3);