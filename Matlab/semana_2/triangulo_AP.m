function [P,A] = triangulo_AP(a,b,c)
% Calcula el perimetro y el area de un traingulo de lados a, b ,c
P = a + b + c;
s = P/2;
A = sqrt(s*(s-a)*(s-b)*(s-c));
end

