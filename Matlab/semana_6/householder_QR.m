%FACTORIZACIÓN QR USANDO HOUSEHOLDER
% A = (a1|a2|...|an); A = Q*R
% w1 = (x-y)/||x-y|| : x = a1, y = (+-sqrt(a1^2+..+an^2), 0..0)
% wj = â(j-1) - bj*e1: bj = {-|a(j-1)| ; |a(j-1)|} â = A(j+1:n)
%
% P1 = I-2ww'
% A1 = P1*A => columna1 A ya está QRada
%
% x2 = A1(:,2), y2 = (A1(1,2),+-sqrt(a2^2+...an^2),0..0)
%
% Q0 = I; Qj = Pj*Q(j-1)
% NOTA: SOLO CAMBIAR SUBMATRIZ A CADA VEZ

function [Q, R] = householder_QR(A)

n = length(A);
Q = eye(n);

for j = 1:n-1
    % Cada vez se cambia solo A(j:n, j:n)
    % Por cada columna de A, vamos haciendola ceros
    w = A(j:n, j); % W = (0...0, sqrt, aj) => w = (sqrt, aj)
    if w(1) > 0
        alpha = -norm(w);
    else
        alpha = norm(w);
    end
    w(1) = w(1) - alpha;
    w = w/norm(w);
    
    % Obtenemos Pn-1..P1*A = R
    % Qt = Q^-1
    P = eye(n-j+1) - 2*(w*w');
    A(j:n, j:n) = P*A(j:n, j:n);
    Q(j:n, :) = P*Q(j:n,:);
end
R = A;
Q = Q';
end