function [L, U] = lu_gauss(A)
%LUFACTORIZATION 
%Factoriza la matriz A como producto de dos matrices L, U

n = length(A); %Dimension

% Obtencion de U (upper triangular) como A
% Simultaneamente se obtiene L (Lower triangular 1-diag)

L = eye(n);

for j = 1:n %Columna
    for i = j+1:n %Filas debajo de la diagonal j,j;
        %Fila(i) <= Fila(i) - A(i,j)/A(j,j)*Fila(j)
        L(i,j) = A(i,j)/A(j,j);
        A(i,:) = A(i,:) - L(i,j)*A(j,:);
    end
end
U = A;
disp(L*U)
end

