% Autor: Rodrigo
% Fecha: 18/02/2018

%------------------MÉTODOS MENÚ PRINCIPAL------------------

% COMENZAR A JUGAR: jugar.
jugar:-write('---------MENÚ PRINCIPAL---------\nPor favor, escribe el número de jugadores (2. para dos jugadores, 1. para jugar contra la máquina, s. para salir.)\n'), read(X), compJugadores(X),!.

dificultadMaquina:-write('Por favor, seleccione la inteligencia de la máquina (1. para máquina poco inteligente, 2. para máquina inteligente, s. para salir.)\n'), read(X), compDificultad(X),!.

% SEGÚN LA ELECCIÓN DEL USUARIO
conectaMaquinaFacil:-write('Las fichas del jugador 1 son X y las del jugador 2 son O. El jugador 2 es controlado por la máquina\n'), iniciar(X), mostrar(X), !, cambiar_turno_maquina_facil('X',X).
conectaMaquinaDificil:-write('Las fichas del jugador 1 son X y las del jugador 2 son O. El jugador 2 es controlado por la máquina\n'), iniciar(X), mostrar(X), !, cambiar_turno_maquina_dificil('X',X).
conectaDosJugadores:-write('Las fichas del jugador 1 son X y las del jugador 2 son O.\n'), iniciar(X), mostrar(X), !, cambiar_turno('X', X).

% TURNOS MÁQUINA TONTA
cambiar_turno_maquina_facil('X', X):- gana('O', X), write('Gana la máquina con cuatro O en línea.\n'),!.
cambiar_turno_maquina_facil('O', X):- gana('X', X), write('Gana el jugador 1 con cuatro X en línea.\n'),!.
cambiar_turno_maquina_facil(_, X):- lleno(X), write('¡Ha habido un empate!'),!.
cambiar_turno_maquina_facil('X', X):- write('Turno jugador 1. Indique la columna por la que quiere introducir su ficha (introduzca s. para salir.):'),
                                      read(J), compColumna(J, J1), !, introducir(X, J1,'X',X2), mostrar(X2), cambiar_turno_maquina_facil('O', X2).
cambiar_turno_maquina_facil('O', X):- write('Turno de la máquina.\n'), aleatorio(_, A1), introducir(X, A1,'mf',X2), mostrar(X2), cambiar_turno_maquina_facil('X', X2).

% TURNOS MÁQUINA INTELIGENTE
cambiar_turno_maquina_dificil('X', X):- gana('O', X), write('Gana la máquina con cuatro O en línea.\n'),!.
cambiar_turno_maquina_dificil('O', X):- gana('X', X), write('Gana el jugador 1 con cuatro X en línea.\n').
cambiar_turno_maquina_dificil(_, X):- lleno(X), write('¡Ha habido un empate!').
cambiar_turno_maquina_dificil('X', X):- write('Turno jugador 1. Indique la columna por la que quiere introducir su ficha (introduzca s. para salir al menú principal):'),
                                        read(J), compColumna(J, J1), !, introducir(X, J1,'X',X2), mostrar(X2), cambiar_turno_maquina_dificil('O', X2).
cambiar_turno_maquina_dificil('O', X):- write('Turno de la máquina.\n'), machine(X,X2), mostrar(X2), cambiar_turno_maquina_dificil('X', X2).

% TURNOS DOS JUGADORES
cambiar_turno('X', X):- gana('O', X), write('Gana el jugador 2 con cuatro O en línea.').
cambiar_turno('O', X):- gana('X', X), write('Gana el jugador 1 con cuatro X en línea.').
cambiar_turno(_, X):- lleno(X), write('¡Ha habido un empate!').
cambiar_turno('X', X):- write('Turno jugador 1. Indique la columna por la que quiere introducir su ficha (introduzca s. para salir al menú principal):'),
                        read(J), compColumna(J, J1), !, introducir(X, J1,'X',X2), mostrar(X2), cambiar_turno('O', X2).
cambiar_turno('O', X):- write('Turno jugador 2. Indique la columna por la que quiere introducir su ficha (introduzca s. para salir al menú principal):'),
                        read(J), compColumna(J, J1), !, introducir(X, J1,'O',X2), mostrar(X2), cambiar_turno('X', X2).


%------------------MÉTODOS MENÚ PRINCIPAL------------------