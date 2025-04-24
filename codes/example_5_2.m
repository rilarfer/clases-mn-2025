% Example 5.2 (Doolittle's decomposition)
A = [3 -1  4;     -2  0  5;      7  2 -2];
B = [6  -4;     3   2;     7  -5];
% Descomposición LU de A
A = LUdec(A);
% Cálculo del determinante de A
determinante = prod(diag(A))
% Resolución de AX = B, columna por columna
for i = 1:size(B, 2)
    X(:, i) = LUsol(A, B(:, i));
end
% Mostrar la solución
X