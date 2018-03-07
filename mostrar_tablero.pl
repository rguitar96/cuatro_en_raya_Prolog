% Autor: Rodrigo
% Fecha: 05/03/2018

%---------------INICIALIZAR E IMPRIMIR TABLERO--------------------

%-------------Fila 6------------------Fila 1----------------
iniciar([[' ',' ',' ',' ',' ',' '], %Columna 1
               [' ',' ',' ',' ',' ',' '],
               [' ',' ',' ',' ',' ',' '],
               [' ',' ',' ',' ',' ',' '],
               [' ',' ',' ',' ',' ',' '],
               [' ',' ',' ',' ',' ',' '],
               [' ',' ',' ',' ',' ',' ']]).%Columna 7

%------------------MOSTRAR TABLERO---------------------------------
mostrar(X):- write(' 1 2 3 4 5 6 7 \n'), mostrarFilas(X,6), write('---------------\n').

%mostrarFilas(X,N) muestra N filas de la matriz X
mostrarFilas(_,0).
mostrarFilas(X,N):- imprimirFila(X,X2),
             Ns is N-1,
             mostrarFilas(X2,Ns).

%imprimirFila(X,X2) muestra la primera línea del tablero X
imprimirFila(X,X2):- write('---------------\n'), write('|'), imprimirColumnas(X,X2), nl.

%imprimirColumnas(X,X2) muestra el primer elemento de cada columna
imprimirColumnas([],_).
imprimirColumnas([[X|X2]|XS],[X2|XS2]):- write(X), write('|'),
                                  imprimirColumnas(XS,XS2).
%------------------MOSTRAR TABLERO---------------------------------