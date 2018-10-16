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
AuxRows = zeros(2,n);
AuxCol = zeros(m,2);
c = 0;
At = A;
bt = b;
for p = 1 : 1 : m - 1
    if A(p,p) > 1E-8
        for j = p + 1 : 1 : m
            if A(j,p) > 1E-8
                for i = p : 1 : n
                 At(j,i) = A(j,i) - (A(p,i) * (A(j,p) / A(p,p))); 
                end
           bt(j) = b(j) - (b(p) * (A(j,p) / A(p,p)));
            end
        end
    else
        for index = 1 : 1 : n
            AuxRows(1,index) = A(1,index);
        end
        for cols = 1 : 1 : m
            if A(cols,p) > 0 && A(cols,p) > 1E-8
               c = cols;
                break;
            end
        end
        for ind = 1 : 1 : n
            AuxRows(2,ind) = A(c,ind);
        end
        for ind = 1 : 1 : n
            A(p,ind) = AuxRows(2,ind);
            A(c,ind) = AuxRows(1,ind);
        end
    end
end

end
