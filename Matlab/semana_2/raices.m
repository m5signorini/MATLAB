% Calcula Raices de un Polinomio
% Pide los coeficientes del polinomio e imprime sus raices

a = input('Coeficiente de 2º grado: ');
b = input('Coeficiente de 1º grado: ');
c = input('Coeficiente de 0º grado: ');
disp('Resultados: ')
disc = b^2-4*a*c;
if a == 0
    disp('No se puede')
    return;
end
if disc < 0
    disp('Raices imaginarias')
    return;
end
if disc == 0
    disp('Solo tiene una raiz')
    x = -b/(2*a)
    return;
end

disp('Tiene dos raices reales')
x1 = (-b+sqrt(b^2-4*a*c))/(2*a)
x2 = (-b-sqrt(b^2-4*a*c))/(2*a)
