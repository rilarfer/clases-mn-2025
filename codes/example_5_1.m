% Example 5.1 (Gauss elimination)
A = vander(1:0.2:2);
b = [0 1 0 1 0 1]';
format long
[x, determinante] = gauss(A, b);
x
determinante