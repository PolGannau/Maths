function [x] = backSubs(A,b)
for i = length(b): -1 : 1
    aux = b(i);
    for j = length(b): -1 : i
        if i ~= length(b)
        aux = aux - A(i,j) * x(j);
        end
    end
    x(i) = aux / A(i,i);
end
end

