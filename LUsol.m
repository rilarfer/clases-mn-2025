function x = LUsol(A, b)
% Resuelve L*U*x = b, donde A contiene tanto L como U;
% es decir, A tiene la forma [L\U].
% USO: x = LUsol(A, b)
% Asegurar que b sea un vector columna
if size(b, 2) > 1
    b = b';
end
n = length(b);
% Sustitución hacia adelante (Ly = b)
for k = 2:n
    b(k) = b(k) - A(k, 1:k-1) * b(1:k-1);
end
% Sustitución hacia atrás (Ux = y)
for k = n:-1:1
    b(k) = (b(k) - A(k, k+1:n) * b(k+1:n)) / A(k, k);
end
x = b;
end