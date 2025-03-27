function root = bisectej1(func, xl, xu, es, imax, xr)
% Encuentra una raíz en un intervalo de f(x) por el método de bisección.
%
% USAGE: root = bisectej1(func, xl, xu, es, imax, xr)
%
% INPUT:
%   func  - Manejador de función que retorna f(x).
%   xl, xu - Límites del intervalo que contiene la raíz.
%   es    - Nivel aceptable de error (%).
%   imax  - Número máximo de iteraciones permitidas.
%   xr    - Valor inicial arbitrario de la raíz (no afecta el cálculo).
%
% OUTPUT:
%   root  - Aproximación de la raíz de f(x).

% Inicializamos error relativo aproximado (ea) y contador de iteraciones
ea = 100;   % Se inicializa con 100% para garantizar la primera iteración
iter = 0;   % Contador de iteraciones

% Bucle principal del método de bisección
while (1)
    xrold = xr;                  % Guardamos el valor anterior de xr
    xr = 0.5 * (xl + xu);         % Calculamos el punto medio del intervalo
    iter = iter + 1;              % Incrementamos el contador de iteraciones

    % Calculamos el error relativo aproximado (ea)
    if xr ~= 0.0
        ea = abs((xr - xrold) / xr) * 100;  % Expresado en porcentaje
    end

    % Evaluamos el producto de f(xl) y f(xr) para determinar la ubicación de la raíz
    test = feval(func, xl) * feval(func, xr);
    
    if test < 0.0
        xu = xr;  % La raíz está en el intervalo [xl, xr]
    elseif test > 0.0
        xl = xr;  % La raíz está en el intervalo [xr, xu]
    else
        ea = 0;   % Se encontró la raíz exacta
    end

    % Condiciones de parada: si el error es menor al deseado o se alcanza imax
    if ea < es || iter >= imax
        break;
    end
end

% Asignamos el valor final de xr como la raíz encontrada
root = xr;
end