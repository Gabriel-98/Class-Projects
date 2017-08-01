create_rotors(R1,R2,R3,Reflector):-
	R3 = [1,3,5,7,9,11,2,15,17,19,23,21,25,13,24,4,8,22,6,0,10,12,20,18,16,14],
	R2 = [0,9,3,10,18,8,17,20,23,1,11,7,22,19,12,2,16,6,25,13,15,24,5,21,14,4],
	R1 = [4,10,12,5,11,6,3,16,21,25,13,19,14,22,24,7,23,20,18,15,0,8,1,17,2,9],
	Reflector = [24,17,20,7,16,18,11,3,15,23,13,6,14,10,12,8,4,1,5,25,2,22,21,9,0,19].
insert_first(L,N,L2):- L2 = [N|L].
insert_last([],N,[N]).
insert_last([X|Y],N,L):-
	insert_last(Y,N,L2),
	L = [X|L2].
concatenate([],L2,L2).
concatenate(L1,[],L1).
concatenate([X|Y],L2,LL):-
	concatenate(Y,L2,K),
	insert_first(K,X,K2),
	LL = K2.
reverse([],[]).
reverse([X|Y],L2):-
	reverse(Y,L3),
	insert_last(L3,X,L2).
search([],_,_):- false, !.
search([X|_],0,X).
search([_|Y],Pos,N):-
	PosN is Pos-1,
	search(Y,PosN,N).
find_pos([X|_],X,0).
find_pos([_|Y],N,Pos):-
	find_pos(Y,N,K),
	Pos is K+1.
sum_list([],0).
sum_list([X|Y],N):-
	sum_list(Y,SN),
	N is SN+X.
ascii_65([],[]).
ascii_65([X|Y],L2):-
	ascii_65(Y,L3),
	X1 is X - 65,
	L2 = [X1|L3].
ascii65([],[]).
ascii65([X|Y],L2):-
	ascii65(Y,L3),
	X1 is X + 65,
	L2 = [X1|L3].
turn(0,1).
turn(N,0):- N \= 0.
inverted_rotor(_,26,[]).
inverted_rotor(R,Pos,RR):-
	find_pos(R,Pos,N),
	PosN is Pos + 1,
	inverted_rotor(R,PosN,K),
	insert_first(K,N,R2),
	RR = R2.
new_rotors([],RR,RR).
new_rotors([X|Y],RR,K):-
	new_rotors(Y,RR,K1),
	inverted_rotor(X,0,L),
	insert_last(K1,L,K2),
	K = K2.
generate_rotors(R,RR):-
	create_rotors(_,_,_,Reflector),
	reverse(R,K1),
	insert_last(K1,Reflector,K2),
	new_rotors(K1,K2,K3),
	RR = K3.
generate_config(C,CC):-
	reverse(C,C2),
	insert_last(C,0,C3),
	concatenate(C3,C2,C4),
	CC = C4.
change_char(CH,[],[],CH).
change_char(CH,[X|Y],[X2|Y2],Char):-
	change_char(CH,Y,Y2,C),
	K is C + X2,
	K2 is K mod 26,
	search(X,K2,K3),
	K4 is K3 + 26 - X2,
	K5 is K4 mod 26,
	Char is K5.
new_config([],[]).
new_config([X|Y],C2):-
	new_config(Y,L1),
	sum_list(L1,N),
	turn(N,K),
	K1 is (X+K) mod 26,
	insert_first(L1,K1,L2),
	C2 = L2,
	!.
encrypt_list([],_,_,[]).
encrypt_list([X|Y],R,C,E):-
	reverse(C,P),
	new_config(P,C2),
	reverse(C2,P2),
	encrypt_list(Y,R,P2,E2),
	generate_config(C,C3),
	reverse(R,R2),
	change_char(X,R2,C3,Char),        % Encrypt char
	insert_first(E2,Char,L2),         % insert char encypted
	E = L2.
encrypt(M,R,C,E):-
	atom_codes(M,L1),                 % convert the message in a list
	atom_codes(C,C2),                 % convert configuration in list ascii
	ascii_65(L1,L2),                  % Decrement each code in 65
	ascii_65(C2,C3),                  % .........................
	reverse(C3,C4),
	generate_rotors(R,RR),
	encrypt_list(L2,RR,C4,L3),
	ascii65(L3,L4),                   % Aument each code in 65
	atom_codes(L5,L4),
	E = L5.
decrypt(E,R,C,M):-
	encrypt(E,R,C,M).
% create_rotors(R1,R2,R3,Reflector), encrypt("MENSAJE",[R1,R2,R3],"ABC",E).
% create_rotors(R1,R2,R3,Reflector), encrypt("MENSAJE",[R1,R2,R2,R3,R1],"ABCDE",E).