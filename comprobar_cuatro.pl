% Autor: Rodrigo
% Fecha: 05/03/2018

%------------------MÉTODOS COMPROBAR CUATRO EN RAYA EN TABLERO------------------

% VERTICAL
gana(X,T):- append(_, [L|_], T), append(_, [X,X,X,X|_], L).

% HORIZONTAL (VER SI HAY 4 COLUMNAS CON LA PIEZA X Y DESPUÉS VER QUE ESTÉN A LA MISMA ALTURA)
gana(X,T):- append(_,[C1,C2,C3,C4|_],T),
                   append(I1,[X|_],C1),
                   append(I2,[X|_],C2),
                   append(I3,[X|_],C3),
                   append(I4,[X|_],C4),
                   length(I1,M), length(I2,M), length(I3,M), length(I4,M).
                   
% DIAGONAL (VER SI HAY 4 COLUMNAS CON LA PIEZA X Y DESPUÉS VER QUE ESTÉN EN LA MISMA DIAGONAL)
gana(X,T):- append(_,[C1,C2,C3,C4|_],T), append(I1,[X|_],C1),append(I2,[X|_],C2),append(I3,[X|_],C3),append(I4,[X|_],C4),
                   length(I1,M1), length(I2,M2), length(I3,M3), length(I4,M4),
                   (M2 is M1+1, M3 is M2+1, M4 is M3+1; M2 is M1-1, M3 is M2-1, M4 is M3-1).

% ESTÁ LLENO EL TABLERO T?
lleno(T):- \+ (append(_,[C|_],T), append(_,[' '|_],C)).

%------------------MÉTODOS COMPROBAR CUATRO EN RAYA EN TABLERO------------------