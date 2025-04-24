% Método SOR
clear
A = [2 1 1 -1; 1 9 8 4; -1 3 5 2; 0 1 0 1];
b = [-3 15 10 2]';
for i = 1:4
    N(i,:) = A(i,:) / A(i,i);
    b(i) = b(i) / A(i,i);
end
U = triu(N,1);
L = tril(N,1);
X0 = zeros(1,4);
X = X0; w = 1.3;
K = 0; Norma = 1;
fprintf(' K X(1) X(2) X(3) X(4) Norma\n')
fprintf('%d %8.4f %8.4f %8.4f %8.4f\n',K,X(1),X(2),X(3),X(4))
while Norma > 0.01
    K = K + 1;
    fprintf('%d ', K)
    for i = 1:4
        sumaL = 0; sumaU = 0;
        for j = 1:4
            if j < i
                sumaL = sumaL + L(i,j) * X(j);
            elseif j > i
                sumaU = sumaU + U(i,j) * X0(j);
            end
        end
        X(i) = X0(i) + w * (b(i) - sumaL - X0(i) - sumaU);
        fprintf('%8.4f ', X(i))
    end
    Norma = norm(X - X0);
    fprintf('%8.4f\n', Norma)
    X0 = X;
end