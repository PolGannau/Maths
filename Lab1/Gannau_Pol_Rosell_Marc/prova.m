A = [2 -1 1;3 1 -2;-1 2 5];
b = [2;9;-5];
[M,s] = ownTriangulation(A,b)

[x] = backSubs(M,s)