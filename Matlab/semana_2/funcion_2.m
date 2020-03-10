function y = funcion_2(x)
% funcion_2
% Version con error:
y = (exp(x).*log(1+exp(-x)));
% Version corregida (usando operador lógico):
flag = x < 27;
y = flag.*y - (flag-1).*(1+exp(-x/2));

    
end

