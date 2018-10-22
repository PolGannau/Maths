function [At, bt]= ownTriangulation(A,b)
% ownTriangulation function triangulates a matrix using pivots
% ATENTION! it does not work with zeros in it's diagonal
[m,n] = size(A);
At = A;
bt = b;
for p = 1 : 1 : m
    for j = p + 1 : 1 : m
        for i = p : 1 : m
           At(j,i) = (A(p,p) * A(j,i)) - (A(j,p) * A(p,i)); 
        end
        bt(j) = (A(p,p) * b(j)) - (A(j,p) * b(p));
    end
end
end