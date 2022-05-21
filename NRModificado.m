%Con estos comandos eliminamos todo lo que esta en pantalla
clear
clc

disp('Metodo Newton Raphson Modificado');

syms x
%Ingresamos los datos necesarios
f = input('Introduzca la Funcion f(x): ');
vi = input('Introduzca el valor inicial de x: ');
itr = input('Iteraciones a realizar: ');

%Generamos una grafica de la funcion inicial
fplot(f)
grid on

%Derivamos las funciones
dx = diff(f);
dx = simplify(dx);
dx2 = diff(dx);

%Mostramos nuestras funciones
fprintf('\nFuncion Ingresada: ');
disp(f);
fprintf('Primera Derivada: ');
disp(dx);
fprintf('Segunda Derivada: ');
disp(dx2);

f = inline(f);
dx = inline(dx);
dx2 = inline(dx2);

ea = 100;
i = 1;

while i <= itr
    xi=vi-(f(vi)*dx(vi))/((dx(vi)^2)-(f(vi)*dx2(vi)));
    ea = abs(((xi - vi)/xi)*100);
    vi=xi;
    fprintf('\nIteracion %d Raiz = %10.20f ', i, vi);
    fprintf('\nIteracion %d Error = %10.20f \n', i, ea);
    i = i + 1;
end
