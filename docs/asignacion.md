# Problemas Propuestos

## 1. Gauss con múltiples vectores constantes

Modifique la función `gauss` para que funcione con $m$ vectores constantes.  
Pruebe el programa resolviendo $\mathbf{AX} = \mathbf{B}$, donde:

\[
\mathbf{A} =
\begin{bmatrix}
2 & -1 & 0 \\
-1 & 2 & -1 \\
0 & -1 & 1
\end{bmatrix}, \quad
\mathbf{B} =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
\]

---

## 2. Matriz de Hilbert

Un ejemplo conocido de una matriz mal condicionada es la *matriz de Hilbert*:

\[
\mathbf{A} =
\begin{bmatrix}
1 & \tfrac{1}{2} & \tfrac{1}{3} & \cdots \\
\tfrac{1}{2} & \tfrac{1}{3} & \tfrac{1}{4} & \cdots \\
\tfrac{1}{3} & \tfrac{1}{4} & \tfrac{1}{5} & \cdots \\
\vdots & \vdots & \vdots & \ddots
\end{bmatrix}
\]

Escriba un programa que resuelva $\mathbf{Ax} = \mathbf{b}$ mediante el método de Doolittle, donde $\mathbf{A}$ es una matriz de Hilbert de tamaño $n \times n$ y:

\[
b_i = \sum_{j=1}^{n} A_{ij}
\]

El programa **no debe tener entrada** aparte de $n$. Determine el valor máximo de $n$ para el cual la solución esté dentro de 6 cifras significativas de:

\[
\mathbf{x} = \begin{bmatrix} 1 & 1 & 1 & \cdots \end{bmatrix}^T
\]

---

## 3. Solución con Choleski

Escriba una función para la fase de solución del método de descomposición de Choleski.  
Pruebe la función resolviendo $\mathbf{Ax} = \mathbf{b}$, donde:

\[
\mathbf{A} =
\begin{bmatrix}
4 & -2 & 2 \\
-2 & 2 & -4 \\
2 & -4 & 11
\end{bmatrix}, \quad
\mathbf{b} =
\begin{bmatrix}
6 \\
-10 \\
27
\end{bmatrix}
\]

Use la función `choleski` para la fase de descomposición.

---

## 4. Precisión Numérica

Resuelva el sistema $\mathbf{Ax} = \mathbf{b}$, donde:

\[
\mathbf{A} =
\begin{bmatrix}
3.50 & 2.77 & -0.76 & 1.80 \\
-1.80 & 2.68 & 3.44 & -0.09 \\
0.27 & 5.07 & 6.90 & 1.61 \\
1.71 & 5.45 & 2.68 & 1.71
\end{bmatrix}, \quad
\mathbf{b} =
\begin{bmatrix}
7.31 \\
4.23 \\
13.85 \\
11.55
\end{bmatrix}
\]

Calcule $|\mathbf{A}|$ y $\mathbf{Ax}$ y comente sobre la precisión de la solución.

---

[← Volver al inicio](index.md)
