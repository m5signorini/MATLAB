function y = suma_impar(N)
%suma_impar
%   Suma los impares desde 1 hasta 2N-1
%   sum(1:2:2*N-1) = -N + 2*N(N+1)/2
y = 0;
for i = 1:2:(2*N-1)
    y = y + i;
end
end

