% METODO ITERATIVO DE JACOBI
% Pedimos una matriz A, un vector b y una tolerancia e

A = input('Introduzca la matriz cuadrada A: ')
b = input('Introduzca vector b: ')
t = input('Introduzca la tolerancia de error: ')
% Suponemos parametros correctos

itmax = 50;
n = length(A);
x1 = zeros(n,1);
x2 = zeros(n,1);
it = 0;

error = t + 1;

while error > t && it < itmax
    it = it + 1;
    
    % P = M^-1 * N; c = M^-1 * b
    % x = Px + c
    % x[k+1](i) = (1/a(i,i))*(b(i) - sum[x[k](i)*a(i,j)])
    x1 = x2;
    
    for i = 1:n
        % z variable auxiliar
        z = 0;
        for j = 1:n
            if j ~= i
                z = z + x1(j)*A(i,j);
            end
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


% MATEMATICAMENTE

% Hallamos la descomposicion A = M - N: M = diag(A)
% Calculamos diag de la inversa de M primero: diag(d) = M^-1
%{
d = diag(A);
for i = 1:n
    d(i) = 1/d(i);
end
%}

% diag(matrix) => vector; diag(vector) => crea matrix
% M = diag(diag(A));
% N = M - A;
% P = diag(d) * (diag(diag(A)) - A);







