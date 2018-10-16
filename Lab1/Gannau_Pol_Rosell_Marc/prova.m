A = [3 -1 1 1; 2 1 1 2; 3 -1 1 4; 5 1 -1 1];
b = [0;-2;-3;6];
[M,s] = ownTriangulation(A,b)

[x] = backSubs(M,s)