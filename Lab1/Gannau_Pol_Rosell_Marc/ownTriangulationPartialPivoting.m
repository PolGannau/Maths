function [flag, At, bt]= ownTriangulationPartialPivoting(A,b)
% [At,bt] = ownTriangulationPartialPivoting(A,b)
% Performs a forward elimination proces over the matrix [A b]
%	such that A*x = b and At*x = bt share the same solution x
%	with partial pivoting
% Inputs:
%	A: Coefficients matrix
%	b: Independent term
% Outputs:
%	flag: Flag = 0 -> The system of LE has a unique solution
%	      Flag = 1 -> The system of LE has infinite or has not a solution		 
%	At: Upper triangular matrix
% 	bt: Modified independent term

[m,n] = size(A);
At = A;
bt = b;
for p = 1 : 1 : m - 1
    for j = p + 1 : 1 : m
        for i = p : 1 : n
            if A(p,p) > 1E-8
           At(j,i) = A(j,i) - (A(p,i) * (A(j,p) / A(p,p))); 
            end
        end
        bt(j) = b(j) - (b(p) * (A(j,p) / A(p,p)));
    end
end

end
