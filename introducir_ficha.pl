% Autor: Rodrigo
% Fecha: 06/03/2018

%------------------MÉTODOS INTRODUCIR FICHA EN EL TABLERO------------------

% MÉTODO PARA SUSTITUIR EN LA LISTA ARG1 LA POSICIÓN ARG2 POR EL ELEMENTO ARG3, RESULTANDO EN LA LISTA ARG4
sustituir([_|T],1,X,[X|T]).
sustituir([H|T],I,X,[H|R]):-I1 is I-1, sustituir(T,I1,X,R).

% INTRODUCE EN LA COLUMNA Columna DEL TABLERO T EL ELEMENTO J, RESULTANDO EN EL TABLERO T2
introducir(T, Columna, J, T2):- nth1(Columna, T, C), primeraColumna(T, C, J, 6, _, L), sustituir(T, Columna, L, T2).

primeraColumna(T, _, J, I, _, _):- J = mf, I is 0, cambiar_turno_maquina_facil('O', T).

primeraColumna(T, _, J, I, _, _):- I is 0, write('Esa columna está llena.\n'), cambiar_turno(J, T).
primeraColumna(_, C, J, I, X, L):- nth1(I, C, X), X = ' ', !, (J = mf -> sustituir(C,I,'O',L);sustituir(C,I,J,L)).
primeraColumna(T, C, J, I, X, L):- I1 is I-1, primeraColumna(T, C, J, I1, X, L).


%------------------MÉTODOS INTRODUCIR FICHA EN EL TABLERO------------------
