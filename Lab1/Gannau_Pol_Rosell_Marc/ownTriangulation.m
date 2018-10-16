function [At, bt]= ownTriangulation(A,b)
[m,n] = size(A);
At = A;
bt = b;
for p = 1 : 1 : m - 1
    for j = p + 1 : 1 : m
        for i = p : 1 : n
           At(j,i) = A(p,p) * A(j,i) - A(j,p) * A(p,i); 
        end
        bt(j) = A(p,p) * b(j) - A(j,p) * b(p);
    end
end
end