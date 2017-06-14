import:-
    csv_read_file('C:/Users/Daniel/Documents/GitHub/KBpathsProLog/NELL1.csv', Data, [functor(arc)]),
    maplist(assert, Data).
	
relations(X,Y,Z):-
	arc(X,V,Y),
	write(X),
	write(' is '),
	write(V),
	write(' '),
	write(Y).
	
relations(X,Y,Z):-
	arc(X,V,W),
	relations(X,W,Z).

	
	
	
	
	