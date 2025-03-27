function root = newtonRaphson_segura(func, dfunc, a, b, tol)
% Método de Newton-Raphson combinado con bisección para encontrar una raíz de f(x) = 0.
% USO:
%   root = newtonRaphson_segura(func, dfunc, a, b, tol)
% ENTRADAS:
%   func  - función manejable que evalúa f(x)
%   dfunc - función manejable que evalúa f'(x)
%   a, b  - extremos del intervalo que encierra la raíz
%   tol   - tolerancia de error (opcional, por defecto es 1.0e6 * eps)
% SALIDA:
%   root - raíz encontrada (o NaN si no hay convergencia)
if nargin < 5; tol = 1.0e6 * eps; end           % Tolerancia por defecto
fa = feval(func, a); fb = feval(func, b);       % Evaluar extremos del intervalo
% Verifica si alguno de los extremos ya es raíz
if fa == 0; root = a; return
elseif fb == 0; root = b; return
end
% Verifica que la raíz esté encerrada
if fa * fb > 0
    error('La raíz no está encerrada en (a, b)')
end
x = (a + b) / 2;                       % Punto inicial: punto medio
for i = 1:30
    fx = feval(func, x);               % Evaluar f(x)
    if abs(fx) < tol                   % Verifica si ya encontró la raíz
        root = x; return
    end
    % Ajuste del intervalo usando bisección
    if fa * fx < 0
        b = x; fb = fx;
    else
        a = x; fa = fx;
    end
    dfx = feval(dfunc, x);             % Evaluar f'(x)
    if abs(dfx) == 0                   % Evitar división por cero
        dx = b - a;
    else
        dx = -fx / dfx;                % Paso de Newton-Raphson
    end
    x = x + dx;                        % Nueva estimación
    % Si la estimación sale del intervalo, usar bisección
    if (x < a) || (x > b)
        dx = (b - a) / 2;
        x = a + dx;
    end
    % Verificación de convergencia
    if abs(dx) < tol * max(abs(b), 1.0)
        root = x; return
    end
end
root = NaN;                            % Si no converge en 30 iteraciones
end