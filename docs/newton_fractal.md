# Fractal de Newton-Raphson

Este script genera un **fractal en el plano complejo** usando el método de Newton-Raphson para encontrar las raíces de la función:

\[
f(z) = z^3 - 1
\]

Cada punto se colorea según la raíz a la que converge, revelando las **cuencas de atracción**.

---

## Código en MATLAB

```matlab title="newton_fractal.m"
close all; clear all; clc;

% Función y derivada
f  = @(z) z.^3 - 1;
fp = @(z) 3*z.^2;

% Raíces
root1 = 1;
root2 = -1/2 + 1i*sqrt(3)/2;
root3 = -1/2 - 1i*sqrt(3)/2;

% Malla en el plano complejo
nx = 1000; ny = 1000;
xmin = -2; xmax = 2;
ymin = -2; ymax = 2;

x = linspace(xmin, xmax, nx);
y = linspace(ymin, ymax, ny);
[X, Y] = meshgrid(x, y);
Z = X + 1i*Y;

% Iteraciones de Newton
nit = 40;
for n = 1:nit
    Z = Z - f(Z) ./ fp(Z);
end

% Clasificación por raíz
eps = 0.001;
Z1 = abs(Z - root1) < eps;
Z2 = abs(Z - root2) < eps;
Z3 = abs(Z - root3) < eps;
Z4 = ~(Z1 + Z2 + Z3); % No convergió

% Visualización
figure;
map = [1 0 0;   % rojo
       0 1 0;   % verde
       0 0 1;   % azul
       0 0 0];  % negro
Z = (Z1 + 2*Z2 + 3*Z3 + 4*Z4);
image([xmin xmax], [ymin ymax], Z);
colormap(map);
set(gca, 'YDir', 'normal');

% Etiquetas
axis equal; axis tight;
set(gca, 'XTick', linspace(xmin,xmax,5), 'YTick', linspace(ymin,xmax,5));
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);
title('Fractal from $f(z)=z^3-1$', 'Interpreter', 'latex', 'FontSize', 16);
```