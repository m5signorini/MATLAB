% APLICACION DEL METODO DE GAUSS
function x = gauss(A,b)
n = length(A); %Dimension

% Transformacion en uno trinagular

for j = 1:n %Columna
    for i = j+1:n %Filas debajo de la diagonal j,j;
        %Fila(i) <= Fila(i) - A(i,j)/A(j,j)*Fila(j)
        L = A(i,j)/A(j,j);
        A(i,:) = A(i,:) - L.*A(j,:);
        b(i) = b(i) - L*b(j);
    end
end
disp([A transpose(b)])

% Resolucion del sistema superior

for i = n:-1:1 % Fila de abajo a arriba
    for j = n:-1:i+1 % Derecha a izquierda
        % Resta de los valores x ya resueltos sobre b
        b(i) = b(i) - x(j)*A(i,j);
    end
    x(i) = b(i)/A(i,i);
end
end