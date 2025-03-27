# Newton-Raphson Simple

```matlab title="newton_simple.m"
function [root, numIter] = newton_simple(func, dfunc, x, tol)
% Versión simple del método de Newton-Raphson.
% USO:
%   [root, numIter] = newton_simple(func, dfunc, x, tol)
% ENTRADAS:
%   func  - función manejable que evalúa f(x)
%   dfunc - función manejable que evalúa f'(x)
%   x     - valor inicial (x0)
%   tol   - tolerancia al error (opcional, por defecto 1.0e6*eps)
% SALIDAS:
%   root     - aproximación de la raíz
%   numIter  - número de iteraciones realizadas

if nargin < 4; tol = 1.0e6 * eps; end    % Establecer tolerancia por defecto
numIter = 0;
for i = 1:50                   % Máximo de 50 iteraciones
    fx = feval(func, x);      % Evaluar función
    dfx = feval(dfunc, x);    % Evaluar derivada
    if dfx == 0               % Evita división por cero
        root = NaN; return
    end
    dx = -fx / dfx;           % Paso de Newton
    x = x + dx;               % Actualiza estimación
    if abs(dx) < tol          % Criterio de convergencia
        root = x; numIter = i; return
    end
end
root = NaN;                   % No convergió en 50 iteraciones
end
```