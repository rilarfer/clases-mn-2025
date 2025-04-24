% Método de Gauss-Seidel
clear
A = [4 -1  0  0;-1  4 -1  0; 0 -1  4 -1;0  0 -1  4];
b = [1 1 1 1]';
X0 = zeros(1, 4);  % Vector inicial
X = X0;
K = 0;
Norma = 1;
fprintf(' K     X(1)     X(2)     X(3)     X(4)     Norma\n')
while Norma > 0.0001
    K = K + 1;
    fprintf('%2d ', K)
    for i = 1:4
        suma = 0;
        for j = 1:4
            if i ~= j
                suma = suma + A(i,j) * X(j);  % Usa valores nue. o act.
            end
        end
        X(i) = (b(i) - suma) / A(i,i);
        fprintf('%10.4f ', X(i))
    end
    Norma = norm(X0 - X);
    fprintf('%10.4f\n', Norma)
    X0 = X;
        if K > 17
        disp('No se alcanzó la convergencia')
        break
    end
end