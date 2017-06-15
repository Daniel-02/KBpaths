import:-
    csv_read_file('C:/Users/Daniel/Documents/GitHub/KBpathsProLog/NELL1.csv', Data, [functor(arc)]),
    maplist(assert, Data).
	
relations(X,Y):-
	arc(X,V,Y),
	write(X),
	write('-'),
	write(V),
	write('-'),
	write(Y).
	
relations(X,Y):-
	arc(Y,V,X),
	write(Y),
	write('-'),
	write(V),
	write('-'),
	write(X).
	
relations(X,Y):-
	arc(X,V,W),
	write(X),
	write('-'),
	write(V),
	write('-'),
	write(W),
	write('\n'),
	relations(W,Y).

relations(X,Y):-
	arc(W,V,X),
	write(W),
	write('-'),
	write(V),
	write('-'),
	write(X),
	write('\n'),
	relations(W,Y).
	
%relations(X,Y):-
%	arc(W,V,Y),
%	write(W),
%	write('-'),
%	write(V),
%	write('-'),
%	write(Y),
%	write('\n'),
%	relations(X,W).
	
%relations(X,Y):-
%	arc(Y,V,W),
%	write(Y),
%	write('-'),
%	write(V),
%	write('-'),
%	write(W),
%	write('\n'),
%	relations(X,W).

	 
	
	
	
	