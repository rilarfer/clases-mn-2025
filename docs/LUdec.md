# Descomposición LU — Doolittle

Esta función realiza la descomposición LU de una matriz $\mathbf{A}$ sin pivoteo, sobrescribiéndola con la forma [L\U].

## Código

```matlab
function A = LUdec(A)
% LU decomposition of matrix A; returns A = [L\U]
% USO: A = LUdec(A)

n = size(A, 1);

for k = 1:n-1
    for i = k+1:n
        if A(i,k) ~= 0.0
            lambda = A(i,k) / A(k,k);
            A(i,k+1:n) = A(i,k+1:n) - lambda * A(k,k+1:n);
            A(i,k) = lambda;
        end
    end
end
```

---

[⭠ Volver al inicio](index.md)
