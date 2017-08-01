append_list([],R,R).
append_list([X|Y],R,L):-
    append_list(Y,R,L2),
    L = [X|L2].

multiplicacion([],_,[]):- !.
multiplicacion(_,[],[]):- !.
multiplicacion([_|Y],R,L):-
    multiplicacion(Y,R,L2),
    append_list(R,L2,L3),
    L = L3.
pow_list(_,[],[a]):- !.
pow_list(L,[_|Y2],R):-
    pow_list(L,Y2,R2),
    multiplicacion(L,R2,R3),
    R = R3.