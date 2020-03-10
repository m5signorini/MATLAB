% METODO DE GAUSS-SEIDEL

A = input('Introduzca la matriz cuadrada A: ')
b = input('Introduzca vector b: ')
t = input('Introduzca la tolerancia de error: ')
% Suponemos parametros correctos

itmax = 10000;
n = length(A);
x1 = zeros(n,1);
x2 = zeros(n,1);
it = 0;

error = t + 1;

while error > t && it < itmax
    it = it + 1;
    
    % P = M^-1 * N; c = M^-1 * b
    % x = Px + c
    % x[k+1](i) = (1/a(i,i))*(-sum(1..i-1)[a(i,j)*x[k+1](j)] - sum(i+1..n)[a(i,j)*x[k](j)] + b)
    x1 = x2;
    
    for i = 1:n
        % z variable auxiliar = sum1 + sum2
        z = 0;
        for j = 1:1:i-1
            z = z + x2(j)*A(i,j);
        end
        for j = i+1:1:n
            z = z + x1(j)*A(i,j);
        end
        z = b(i) - z;
        % z = b - N*x
        
        %ALTERNATIVA
        % ind = [1:i-1 i+1:n];
        % S = A(i,ind)*x(ind);
        x2(i) = z/A(i,i);
    end
    error = norm(x2 - x1);
end

if it >= itmax
    disp('Exceso de iteraciones cometido')
    disp(error)
    return
end

disp('El resultado obtenido es ')
disp(x2)
disp('El numero de iteraciones es ')
disp(it)
disp('El error cometido es ')
disp(error)