% Autor: Rodrigo
% Fecha: 07/03/2018

%------------------COMPROBAR LAS ENTRADAS DE USUARIO------------------

% COMPROBAMOS EL NÚMERO DE JUGADORES
compJugadores(X):- X = e, abort.
compJugadores(X):- X is 1, dificultadMaquina.
compJugadores(X):- X is 2, conectaDosJugadores.
compJugadores(_):- write('Entrada inválida\n'), jugar.

% COMPROBAMOS LA DIFICULTAD
compDificultad(X):- X = s, abort.
compDificultad(X):- X is 1, conectaMaquinaFacil.
compDificultad(X):- X is 2, conectaMaquinaDificil.

% COMPROBAMOS LA COLUMNA INTRODUCIDA
compColumna(X, _):- X = s, abort.
compColumna(X, X1):-integer(X), between(1,7,X), X1 is X,!.
compColumna(_, X1):-write('Introduce un número del 1 al 6.\n'), read(J), compColumna(J, X1).


%------------------COMPROBAR LAS ENTRADAS DE USUARIO------------------