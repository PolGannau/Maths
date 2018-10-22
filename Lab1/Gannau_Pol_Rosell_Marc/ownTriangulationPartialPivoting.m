function [flag, At, bt]= ownTriangulationPartialPivoting(A,b)
% Outputs:
%	flag: Flag = 0 -> The system of LE has a unique solution
%	      Flag = 1 -> The system of LE has infinite or has not a solution		 


[m,n] = size(A);
AuxRows = zeros(2,n);
AuxCol = zeros(m,2);
auxColChange = 0;
auxRowChange = 0;
toBreak = 0;
c = 0;
flag = 1;
At = A;
bt = b;
for p = 1 : 1 : m - 1 
    toBreak = 0;
    for col = p : 1 : n
        for row = 1 : 1 : m
            if A(row,col) == 0 && row > p
                auxColChange = col;
                auxRowChange = row;
                for ind = 1 : 1 : m
                AuxCol(ind,1) = A(ind,auxColChange);
                AuxCol(ind,2) = A(ind,auxRowChange-1);
                end
                for ind = 1 : 1 : m
                A(ind,auxRowChange-1) = AuxCol(ind,1);
                A(ind,auxColChange) = AuxCol(ind,2);
                end
                toBreak =1;
                break;
            end
            if toBreak == 1
                break;
            end
        end
        if toBreak == 1
                break;
        end
    end
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
