% FACTORIZACION CHOLESKYANA
% A = CC': A simetrica def. positiva
% A = LU = LDL' = (L*sqrt(U))(sqrt(U)*L')

function [C] = cholesky(A)
[m, n] = size(A);
if m ~= n
    disp('ERROR')
    return;
end

if A ~= transpose(A)
    disp('ERROR')
    return;
end

[L, U] = lu_gauss_pivot(A);
U = diag(diag(U));

C = L*sqrt(U);

end