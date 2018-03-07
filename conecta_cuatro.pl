% Autor: Rodrigo
% Fecha: 18/02/2018

%------------------M�TODOS MEN� PRINCIPAL------------------

% COMENZAR A JUGAR: jugar.
jugar:-write('---------MEN� PRINCIPAL---------\nPor favor, escribe el n�mero de jugadores (2. para dos jugadores, 1. para jugar contra la m�quina, s. para salir.)\n'), read(X), compJugadores(X),!.

dificultadMaquina:-write('Por favor, seleccione la inteligencia de la m�quina (1. para m�quina poco inteligente, 2. para m�quina inteligente, s. para salir.)\n'), read(X), compDificultad(X),!.

% SEG�N LA ELECCI�N DEL USUARIO
conectaMaquinaFacil:-write('Las fichas del jugador 1 son X y las del jugador 2 son O. El jugador 2 es controlado por la m�quina\n'), iniciar(X), mostrar(X), !, cambiar_turno_maquina_facil('X',X).
conectaMaquinaDificil:-write('Las fichas del jugador 1 son X y las del jugador 2 son O. El jugador 2 es controlado por la m�quina\n'), iniciar(X), mostrar(X), !, cambiar_turno_maquina_dificil('X',X).
conectaDosJugadores:-write('Las fichas del jugador 1 son X y las del jugador 2 son O.\n'), iniciar(X), mostrar(X), !, cambiar_turno('X', X).

% TURNOS M�QUINA TONTA
cambiar_turno_maquina_facil('X', X):- gana('O', X), write('Gana la m�quina con cuatro O en l�nea.\n'),!.
cambiar_turno_maquina_facil('O', X):- gana('X', X), write('Gana el jugador 1 con cuatro X en l�nea.\n'),!.
cambiar_turno_maquina_facil(_, X):- lleno(X), write('�Ha habido un empate!'),!.
cambiar_turno_maquina_facil('X', X):- write('Turno jugador 1. Indique la columna por la que quiere introducir su ficha (introduzca s. para salir.):'),
                                      read(J), compColumna(J, J1), !, introducir(X, J1,'X',X2), mostrar(X2), cambiar_turno_maquina_facil('O', X2).
cambiar_turno_maquina_facil('O', X):- write('Turno de la m�quina.\n'), aleatorio(_, A1), introducir(X, A1,'mf',X2), mostrar(X2), cambiar_turno_maquina_facil('X', X2).

% TURNOS M�QUINA INTELIGENTE
cambiar_turno_maquina_dificil('X', X):- gana('O', X), write('Gana la m�quina con cuatro O en l�nea.\n'),!.
cambiar_turno_maquina_dificil('O', X):- gana('X', X), write('Gana el jugador 1 con cuatro X en l�nea.\n').
cambiar_turno_maquina_dificil(_, X):- lleno(X), write('�Ha habido un empate!').
cambiar_turno_maquina_dificil('X', X):- write('Turno jugador 1. Indique la columna por la que quiere introducir su ficha (introduzca s. para salir al men� principal):'),
                                        read(J), compColumna(J, J1), !, introducir(X, J1,'X',X2), mostrar(X2), cambiar_turno_maquina_dificil('O', X2).
cambiar_turno_maquina_dificil('O', X):- write('Turno de la m�quina.\n'), machine(X,X2), mostrar(X2), cambiar_turno_maquina_dificil('X', X2).

% TURNOS DOS JUGADORES
cambiar_turno('X', X):- gana('O', X), write('Gana el jugador 2 con cuatro O en l�nea.').
cambiar_turno('O', X):- gana('X', X), write('Gana el jugador 1 con cuatro X en l�nea.').
cambiar_turno(_, X):- lleno(X), write('�Ha habido un empate!').
cambiar_turno('X', X):- write('Turno jugador 1. Indique la columna por la que quiere introducir su ficha (introduzca s. para salir al men� principal):'),
                        read(J), compColumna(J, J1), !, introducir(X, J1,'X',X2), mostrar(X2), cambiar_turno('O', X2).
cambiar_turno('O', X):- write('Turno jugador 2. Indique la columna por la que quiere introducir su ficha (introduzca s. para salir al men� principal):'),
                        read(J), compColumna(J, J1), !, introducir(X, J1,'O',X2), mostrar(X2), cambiar_turno('X', X2).


%------------------M�TODOS MEN� PRINCIPAL------------------