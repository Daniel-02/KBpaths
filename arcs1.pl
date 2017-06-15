import:-
    csv_read_file('C:/Users/Daniel/Documents/GitHub/KBpathsProLog/NELL1.csv', Data, [functor(arc)]),
    maplist(assert, Data).
	
write_list([]).

write_list([E1,R,E2|T]):-
	write(E1),
	write('-'),
	write(R),
	write('-'),
	write(E2),
	write('\n'),
	write_list(T).
	
already_has(_,_,_,[]):-false.

already_has(X,Y,Z,[U,V,W|T]):-
	X = U,
	Y = V,
	Z = W,
	true;
	already_has(X,Y,Z,T).

relations(X,Y):-
	relations(X,Y,1).

relations(X,Y,Z):-
	relations(X,Y,Z,[]),!;
	Z1 is Z+1,
	Z1 < 8,
	relations(X,Y,Z1).
	
relations(X,Y,_,L):-
	arc(X,V,Y),
	write_list(L),
	write(X),
	write('-'),
	write(V),
	write('-'),
	write(Y).
	
relations(X,Y,_,L):-
	arc(Y,V,X),
	write_list(L),
	write(Y),
	write('-'),
	write(V),
	write('-'),
	write(X).
	
relations(X,Y,Z,L):-
	arc(X,V,W),
	Z>0,
	\+(already_has(X,V,W,L)),
	append(L,[X,V,W],T),
	relations(W,Y,Z-1,T);
	arc(W,V,X),
	Z >0,
	\+already_has(W,V,X,L),
	append(L,[W,V,X],T),
	relations(W,Y,Z-1,T).

	 
	
	
	
	