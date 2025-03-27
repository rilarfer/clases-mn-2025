function root = newtonRaphson_sistema(func, x, tol)
% Método de Newton-Raphson para encontrar la raíz de un sistema de
% ecuaciones no lineales: f_i(x_1,x_2,...,x_n) = 0, para i = 1,2,...,n.
% USO:
%   root = newtonRaphson_sistema(func, x, tol)
% ENTRADAS:
%   func - función manejable que retorna el vector [f1, f2, ..., fn]
%   x    - vector columna con la estimación inicial [x1; x2; ...; xn]
%   tol  - tolerancia al error (opcional, por defecto 1.0e4 * eps)
% SALIDA:
%   root - vector solución (aproximación de la raíz)
if nargin == 2; tol = 1.0e4 * eps; end             % Tolerancia por defecto
if size(x,1) == 1; x = x'; end                     % Asegura que x sea columna
for i = 1:30                                       % Máximo 30 iteraciones
    [jac, f0] = jacobian(func, x);                % Calcula Jacobiana y f(x)
    % Criterio de convergencia por magnitud de f(x)
    if sqrt(dot(f0, f0) / length(x)) < tol
        root = x;
        return
    end
    dx = jac \ (-f0);                             % Resuelve J dx = -f
    x = x + dx;                                   % Actualiza solución
    % Criterio de convergencia por cambio en x
    if sqrt(dot(dx, dx) / length(x)) < tol * max(abs(x), 1.0)
        root = x;
        return
    end
end
error('Muchas iteraciones: el método no convergió.');
end