% Autor: Rodrigo
% Fecha: 07/03/2018

%------------------MÉTODOS DECISIONES DE LA MÁQUINA------------------

%INTELIGENCIA MÁQUINA TONTA
aleatorio(A, A1):- A is random(8), (A is 0 -> A1 is 1; A1 is A).


%INTELIGENCIA MÁQUINA LISTA
% SI PODEMOS CONECTAR 4 LO HACEMOS
pensar_movimiento(T,T2):- c(X),introducir(T,X,'O',T2), gana('O',T2),!.

% SI EL RIVAL PUEDE CONECTAR 4 LO IMPEDIMOS
pensar_movimiento(T,T2):- c(X),introducir(T,X,'X',T3), gana('X',T3), introducir(T,X,'O',T2),!.

% SI NO, JUGAMOS EN OTRO SITIO
pensar_movimiento(T,T2):- aleatorio(_,X1),introducir(T,X1,'O',T2),!.

c(1).
c(2).
c(3).
c(4).
c(5).
c(6).
c(7).


%------------------MÉTODOS DECISIONES DE LA MÁQUINA------------------