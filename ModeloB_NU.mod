#Modelo B Braquistócrona

param n, integer; 
param a; 
param b; 
param tol > 0;

#Discretización de los parametros:
param y{i in 0 .. n} = b*(i/n)**2 + tol; 

#Declaración de las variables:
var x{i in 0 .. n} >= 0; 

# Función objetivo
minimize total:
sum {i in 1 .. n} 
sqrt(((x[i] - x[i - 1])**2 + (y[i] - y[i - 1])**2)/y[i - 1]);  

# Restricciones de la trayectoria
subject to primera: x[0] = 0; 
subject to segunda: x[n] =  a;

# Restricciones de inyectividad
subject to tercera {i in 1 .. n}: x[i] - x[i - 1] >= tol;

