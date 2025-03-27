function [jac, f0] = jacobian(func, x)
% Calcula la matriz Jacobiana y el vector f(x) en el punto x.
% USO:
%   [jac, f0] = jacobian(func, x)
% ENTRADAS:
%   func - función manejable que devuelve el vector f(x)
%   x    - vector columna de variables [x1; x2; ...; xn]
% SALIDAS:
%   jac - matriz Jacobiana (n x n) aproximada por diferencias finitas
%   f0  - evaluación de f(x) en el punto actual
h = 1.0e-4;                         % Incremento para diferencia finita
n = length(x);                     % Número de variables
jac = zeros(n);                    % Inicializa matriz Jacobiana
f0 = feval(func, x);               % Evalúa f(x) en el punto actual
for i = 1:n
    temp = x(i);                   % Guarda el valor original de x(i)
    x(i) = temp + h;               % Perturba x(i)
    f1 = feval(func, x);           % Evalúa f(x + h)
    x(i) = temp;                   % Restaura el valor original
    jac(:, i) = (f1 - f0) / h;     % Aproxima derivada parcial
end
end