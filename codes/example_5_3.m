% Example 5.3 (Choleski decomposition)
A = [ 1.44  -0.36   5.52   0.00;
     -0.36  10.33  -7.78   0.00;
      5.52  -7.78  28.40   9.00;
      0.00   0.00   9.00  61.00 ];
% Ejecutar la descomposición de Choleski
L = choleski(A)
% Verificar el resultado
Check = L * L'