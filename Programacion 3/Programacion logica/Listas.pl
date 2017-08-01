head([H|_],H).
last([X],X).
last([_|Y],N):- last(Y,N).
add_first(L,N,L2):- L2 = [N|L].
add_last([],N,[N]).
add_last([X|Y],N,L2):-
	add_last(Y,N,L3),
	L2 = [X|L3].
reverse([],[]).
reverse([X|Y],L2):-
	reverse(Y,L3),
	add_last(L3,X,L2).
Ssamelist([],[]):- true, !.
samelist([H1|_],[H2|_]):- H1 \= H2, false, !.
samelist([_|_],[]):- false, !.
samelist([],[_|_]):- false, !.
samelist([H|T1],[H|T2]):-
	samelist(T1,T2).
member([],_):- false, !.
member([X|_],X):- true, !.
member([_|T],X):- member(T,X).
append([],L2,L2).
append(L1,[],L1).
append(L1,[H|T],L):-
	add_last(L1,H,L3),
	append(L3,T,L).
flatten([],[]).
flatten([X|Y],L):-
	flatten(X,L1),
	flatten(Y,L2),
	append(L1,L2,L).
flatten(X,[X]).