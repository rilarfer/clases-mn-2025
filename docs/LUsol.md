# Fase de Solución LU

Esta función resuelve $\mathbf{LUx} = \mathbf{b}$ usando sustitución hacia adelante y hacia atrás. La matriz `A` contiene [L\U].

## Código

```matlab
function x = LUsol(A, b)
% Solución del sistema LUx = b

n = length(b);

% Sustitución hacia adelante (Ly = b)
for k = 2:n
    b(k) = b(k) - A(k,1:k-1) * b(1:k-1);
end

% Sustitución hacia atrás (Ux = y)
for k = n:-1:1
    b(k) = (b(k) - A(k,k+1:n) * b(k+1:n)) / A(k,k);
end

x = b;
end
```

---

[⭠ Volver al inicio](index.md)
