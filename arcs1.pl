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
	
relations(X,Y,Z,L):-
	arc(X,V,Y),
	write_list(L),
	write(X),
	write('-'),
	write(V),
	write('-'),
	write(Y).
	
relations(X,Y,Z,L):-
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
	append([X,V,W],L,T),
	relations(W,Y,Z-1,T);
	arc(W,V,X),
	Z >0,
	append([W,V,X],L,T),
	relations(W,Y,Z-1,T);	
	arc(W,V,Y),
	Z>0,
	append([W,V,Y],L,T),
	relations(X,W,Z-1,T);
	arc(Y,V,W),
	Z >0,
	append([Y,V,W],L,T),
	relations(X,W,Z-1,T).

	 
	
	
	
	