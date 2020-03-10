% GRAHM SCHMIDT
% Descomponer A (col LI): A = QR
% Q ortonormal y spanQ = spanA; R cuadrada triangular superior
% A = (a1 a2 a3); Q = (q1 q2 q3);
%     ( g1  <a2,q1>  <a3,q1> )
% R = (       g2     <a3,q2> )
%     (                 g3   )

function [Q, R] = grahm_schmidt(A)

[m, n] = size(A); % m filas x n columnas
R = zeros(n);
Q = zeros(m, n);

for j = 1:n         % j columna
    w = A(:,j);
    for i = 1:1:j-1 % i fila (para R)
        % Otra opcion: dot(a2,q1)
        R(i,j) = transpose(A(:,j)) * Q(:,i);
        w = w - R(i,j)*Q(:,i);
    end
    R(j,j) = norm(w);
    Q(:,j) = w/R(j,j);
end
end
