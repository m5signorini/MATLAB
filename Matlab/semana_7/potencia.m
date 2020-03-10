%METODO DE LA POTENCIA
%Obtención de los autovalores mediante el método de la potencia
%Tomamos x0 = (x=rand(n,1)/max(x)) => Existe comp = 1
%Generamos sucesión xn: |----> v1 autovector
%yk = A*xk
%ck+1 = {yk.j : |yk.j| = max{yk.i}} primer componente max signado
%xk+1 = yk/ck+1
%
%

A   = input('Introduce una matriz cuadrada: ')
err = input('Tolerancia: ')
itm = input('Maximas iteraciones: ')

n = length(A);

%Tomamos x0: aleatorio "normalizado"
x = rand(n,1);
x = x/max(x);

y = A*x;
[~,c] = max(y);
c = y(c);
i = 0;

while i < itm && norm(y-c*x) > err
    i = i+1;
    
    [~,c] = max(abs(y));
    c = y(c);
    x = y/c;
    y = A*x;
end

disp('AUTOVALOR: ')
disp(c)
disp('AUTOVECTOR: ')
disp(x)