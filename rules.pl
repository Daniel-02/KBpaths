%Regra que l� a knowledge base 'NELL' em csv, cria os predicados arc(entidade1,relacao,entidade2) para cada linha
%e adiciona-os aos fatos
import:-
    csv_read_file('NELL1.csv', Data, [functor(arc)]),
    maplist(assert, Data).
	
%Caso base para o write_list/1
write_list([]).

%Regra que d� print na lista
write_list([E1,R,E2|T]):-
	write(E1),
	write('-'),
	write(R),
	write('-'),
	write(E2),
	write('\n'),
	write_list(T).
	
%Condi��o de parada para o already_has: Lista vazia
already_has(_,_,_,[]):-false.

%Checa se a rela��o X, Y, Z j� est� na lista retornando: true caso esteja
%							 false caso n�o esteja
already_has(X,Y,Z,[U,V,W|T]):-
	X = U,
	Y = V,
	Z = W,
	true;
	already_has(X,Y,Z,T).

%Chamada de relations/2 onde X e Y s�o vari�veis que representam entidades e
% 1 � a altura
relations(X,Y):-
	relations(X,Y,1).

%Chamada de relations/3 onde X e Y s�o vari�veis que representam entidades,
% Z � uma vari�vel que representa a altura procurada e [] � a lista onde ser�o
% armazenadas as triplas (entidade-rela��o-entidade) visitadas. Regra recurssiva
% que primeiro checa a regra relations/4 e ent�o checa relations/3 para Z+1.
% A busca � encerrada quando uma conex�o � encontrada.
relations(X,Y,Z):-
	relations(X,Y,Z,[]),!;
	Z1 is Z+1,
	Z1<7,
	relations(X,Y,Z1).
	
%Chamada de relations/4 que checa se h� uma rela��o V entre as entidades X e Y,
% nesta ordem, e serve como crit�rio de parada. Se houver, escreve toda a lista de % triplas seguida da �ltima rela��o.
relations(X,Y,_,L):-
	arc(X,V,Y),
	write_list(L),
	write(X),
	write('-'),
	write(V),
	write('-'),
	write(Y).
	
%Chamada de relations/4 que checa se h� uma rela��o V entre as entidades Y e X,
% nesta ordem, e serve como crit�rio de parada. Se houver, toda a lista de triplas
% seguida da �ltima rela��o.
relations(X,Y,_,L):-
	arc(Y,V,X),
	write_list(L),
	write(Y),
	write('-'),
	write(V),
	write('-'),
	write(X).
	
%Chamada de relations/4 recursiva que checa se h� uma rela��o V entre X e W ou
% W e X n�o existente na lista de triplas L e ent�o checa a regra relations/4 entre
% W e Y. O limite de entradas na recurs�o � dado pela vari�vel Z.
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