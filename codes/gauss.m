function [x, determinante] = gauss(A, b)
% Resuelve A*x = b usando eliminación de Gauss y calcula det(A)
% USO: [x, det] = gauss(A, b)

% Asegurar que b sea un vector columna
if size(b, 2) > 1
    b = b';
end

n = length(b);

% -------------------------------
% Fase de eliminación
% -------------------------------
for k = 1:n-1
    for i = k+1:n
        if A(i,k) ~= 0
            lambda = A(i,k) / A(k,k);
            A(i,k+1:n) = A(i,k+1:n) - lambda * A(k,k+1:n);
            b(i) = b(i) - lambda * b(k);
        end
    end
end

% Cálculo del determinante si se solicita
if nargout == 2
    determinante = prod(diag(A));
end

% -------------------------------
% Fase de sustitución hacia atrás
% -------------------------------
for k = n:-1:1
    b(k) = (b(k) - A(k,k+1:n) * b(k+1:n)) / A(k,k);
end

x = b;
end
