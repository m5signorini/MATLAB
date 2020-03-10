function [L, U] = lu_gauss_pivot(A)
%LUFACTORIZATION 
%Factoriza la matriz A como producto de dos matrices L, U

n = length(A); %Dimension

% Obtencion de U (upper triangular) como A
% Simultaneamente se obtiene L (Lower triangular 1-diag)

L = zeros(n);
p = [1:n];

for j = 1:n-1 %Columna
    [m ind] = max(abs(A(p(j:n),j))); %Max pivot
    ind = ind + j - 1;
    p([j ind]) = p([ind j]);
    
    for i = j+1:n %Filas debajo de la diagonal j,j;
        %Fila(i) <= Fila(i) - A(i,j)/A(j,j)*Fila(j)
        L(p(i),j) = A(p(i),j)/A(p(j),j);
        A(p(i),j:n) = A(p(i),j:n) - L(p(i),j)*A(p(j),j:n);
    end
end
for i = 1:n
    L(p(i),i) = 1;
end
U = A(p,:);
disp(L*U)
end

