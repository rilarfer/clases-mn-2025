function [x1, x2] = rootsearch(func, a, b, dx)
% Búsqueda incremental para localizar una raíz de la función f(x).
%
% USO:
%   [x1, x2] = rootsearch(func, a, b, dx)
%
% ENTRADAS:
%   func - Manejador de la función que retorna f(x).
%   a, b - Límites del intervalo de búsqueda.
%   dx   - Incremento de búsqueda (paso).
%
% SALIDAS:
%   x1, x2 - Intervalo que encierra la menor raíz dentro de (a, b).
%            Si no se detecta ninguna raíz, devuelve NaN.

    % Inicialización del primer punto y evaluación de f(x)
    x1 = a; 
    f1 = feval(func, x1);
    
    % Inicialización del segundo punto y evaluación de f(x)
    x2 = a + dx; 
    f2 = feval(func, x2);

    % Iteración para encontrar un cambio de signo en f(x)
    while f1 * f2 > 0.0
        % Si hemos sobrepasado el límite derecho del intervalo sin encontrar una raíz
        if x1 >= b
            x1 = NaN; 
            x2 = NaN; 
            return;
        end
        
        % Avanzar al siguiente intervalo
        x1 = x2; 
        f1 = f2;
        x2 = x1 + dx; 
        f2 = feval(func, x2);
    end

end
