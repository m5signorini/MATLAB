% MINIMOS CUADRADOS
% Tenemos Ax=b sin solucion;
% Usamos  AtAx=Atb y A=QR;
% RtQtQRx = RtQtb: QtQ=I y Rt invertible
% Rx = Qtb

function [x, e] = min_cuad(A, b)

[~, n] = size(A);
[Q, R] = grahm_schmidt(A);
d = transpose(Q)*b;
x = zeros(n, 1);

for i = n:-1:1
    x(i) = d(i);
    for j = n:-1:i+1
        x(i) = x(i) - x(j)*R(i,j);
    end
    x(i) = x(i)/R(i,i);
end

e = norm(A*x - b);

end