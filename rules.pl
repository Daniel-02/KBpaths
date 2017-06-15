%Regra que lê a knowledge base 'NELL' em csv, cria os predicados arc(entidade1,relacao,entidade2) para cada linha
%e adiciona-os aos fatos.
%Para que funcione corretamente é necessário ter o caminho correto para o arquivo 'NELL.csv'
import:-
    csv_read_file('NELL.csv', Data, [functor(arc)]),
    maplist(assert, Data).
	
%Caso base para o write_list/1
write_list([]).

%Regra que dá print na lista
write_list([E1,R,E2|T]):-
	write(E1),
	write('-'),
	write(R),
	write('-'),
	write(E2),
	write('\n'),
	write_list(T).
	
%Condição de parada para o already_has: Lista vazia
already_has(_,_,_,[]):-false.

%Checa se a relação X, Y, Z já está na lista retornando: true caso esteja
% false caso não esteja
already_has(X,Y,Z,[U,V,W|T]):-
	X = U,
	Y = V,
	Z = W,
	true;
	already_has(X,Y,Z,T).

%Chamada de relations/2 onde X e Y são variáveis que representam entidades e
% 1 é a altura
relations(X,Y):-
	relations(X,Y,1).

%Chamada de relations/3 onde X e Y são variáveis que representam entidades,
% Z é uma variável que representa a altura procurada e [] é a lista onde serão
% armazenadas as triplas (entidade-relação-entidade) visitadas. Regra recurssiva
% que primeiro checa a regra relations/4 e então checa relations/3 para Z+1.
% A busca é encerrada quando uma conexão é encontrada.
relations(X,Y,Z):-
	relations(X,Y,Z,[]),!;
	Z1 is Z+1,
	Z1<9,
	relations(X,Y,Z1).
	
%Chamada de relations/4 que checa se há uma relação V entre as entidades X e Y,
% nesta ordem, e serve como critério de parada. Se houver, escreve toda a lista de % triplas seguida da última relação.
relations(X,Y,_,L):-
	arc(X,V,Y),
	write_list(L),
	write(X),
	write('-'),
	write(V),
	write('-'),
	write(Y).
	
%Chamada de relations/4 que checa se há uma relação V entre as entidades Y e X,
% nesta ordem, e serve como critério de parada. Se houver, toda a lista de triplas
% seguida da última relação.
relations(X,Y,_,L):-
	arc(Y,V,X),
	write_list(L),
	write(Y),
	write('-'),
	write(V),
	write('-'),
	write(X).
	
%Chamada de relations/4 recursiva que checa se há uma relação V entre X e W ou
% W e X não existente na lista de triplas L e então checa a regra relations/4 entre
% W e Y. O limite de entradas na recursão é dado pela variável Z.
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
