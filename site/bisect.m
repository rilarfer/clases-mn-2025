function root = bisect(func, x1, x2, filter, tol)
% Encuentra una raíz en un intervalo de f(x) por bisección.
% USAGE: root = bisect(func, x1, x2, filter, tol)
% INPUT:
%   func   - Manejador de función que retorna f(x).
%   x1, x2 - Límites del intervalo que contiene la raíz.
%   filter - Filtro de singularidad: 0 = off (default), 1 = on.
%   tol    - Error de tolerancia (default es 1.0e4*eps).
% OUTPUT:
%   root   - Raíz de f(x), o NaN si se sospecha una singularidad.

% Si no se proporciona tol, se asigna el valor predeterminado
if nargin < 5
    tol = 1.0e4 * eps;
end

% Si no se proporciona filter, se asigna 0 (desactivado)
if nargin < 4
    filter = 0;
end

% Evaluamos la función en los extremos del intervalo
f1 = feval(func, x1);
if f1 == 0.0  
    root = x1; % Si x1 es raíz exacta, retornamos x1
    return;
end

f2 = feval(func, x2);
if f2 == 0.0  
    root = x2; % Si x2 es raíz exacta, retornamos x2
    return;
end

% Verificamos si la raíz está encerrada en el intervalo
if f1 * f2 > 0
    error('La raíz no está encerrada en (x1, x2)');
end

% Calculamos el número máximo de iteraciones requeridas
n = ceil(log(abs(x2 - x1) / tol) / log(2.0));

% Método de bisección iterativo
for i = 1:n
    x3 = 0.5 * (x1 + x2); % Punto medio del intervalo
    f3 = feval(func, x3); % Evaluamos la función en el punto medio
    
    % Si el filtro de singularidad está activado, detectamos valores sospechosos
    if (filter == 1) && (abs(f3) > abs(f1)) && (abs(f3) > abs(f2))
        root = NaN;
        return;
    end

    % Si encontramos la raíz exacta, la retornamos
    if f3 == 0.0
        root = x3;
        return;
    end

    % Actualizamos los límites del intervalo según el signo de f(x3)
    if f2 * f3 < 0.0
        x1 = x3;
        f1 = f3;
    else
        x2 = x3;
        f2 = f3;
    end
end

% Si no encontramos la raíz exacta, retornamos la mejor aproximación
root = (x1 + x2) / 2;
end