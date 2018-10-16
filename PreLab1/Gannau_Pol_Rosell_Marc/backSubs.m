function [x] = backSubs(A,b)
% [x] = backSubs(A,b)
% Performs a backsubstitution process over the matrix [A b]
%	to find x such that A*x = b with A upper triangular
% Inputs:
%	A: Upper triangular coefficients matrix
%	b: Independent term
% Outputs:
%	x: Solution of A*x = b

for i = length(b): -1 : 1
    aux = b(i);
    for j = length(b): -1 : i
        if i ~= length(b)
        aux = aux - A(i,j) * x(j);
        end
    end
    x(i) = aux / A(i,i);
end
 x=x';
end

