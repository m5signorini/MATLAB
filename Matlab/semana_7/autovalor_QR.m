%ALGORITMO AUTOVALORES CON QR
%1. Tenemos Ai
%2. Obtenemos Qi,Ri: Ai = Qi * Ri
%3. Ai+1 =  RiQi

A   = input('Introduce A: ')
err = input('Tolerancia: ')
itm = input('Iteraciones maximas: ')

n = length(A);
m = err+1;
i = 0;

while i < itm && m > err
    [Q, R] = grahm_schmidt(A);
    A = R*Q;
    m = 0;
    for j=1:n-1
        m = max([m;abs(A(j+1:n,j))]);
    end
    i = i+1;
end


disp('MATRIZ: ')
disp(A)
disp('AUTOVALORES: ')
disp(diag(A))