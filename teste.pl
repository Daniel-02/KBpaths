%Fatos

progenitor(chaos, gaea).

progenitor(gaea, cyclope).

progenitor(gaea, chronos).

progenitor(gaea, coeus).

progenitor(gaea, oceanus).

progenitor(zeus, apollo).

progenitor(zeus, artemis).

progenitor(hera, ares).

progenitor(zeus, ares).

mulher(hera).

mulher(gaea).

mulher(artemis).

homem(chaos).

homem(cyclope).

homem(chronos).

homem(coeus).

homem(oceanus).

homem(apollo).

homem(ares).

% Regras

filho(Y,X) :- progenitor(X,Y).

mae(X,Y) :- progenitor(X,Y), mulher(X).

pai(X,Y) :- progenitor(X,Y), homem(X).

avo(X,Z) :- progenitor(X,Y),

progenitor(Y,Z).

irmao(X,Y) :- progenitor(Z,X),

progenitor(Z,Y).

ancestral(X,Z) :- progenitor(X,Z).

ancestral(X,Z) :- progenitor(X,Y),

ancestral(Y,Z).

     move(1,X,Y,_) :-  
         write('Move top disk from '), 
         write(X), 
         write(' to '), 
         write(Y), 
         nl. 
     move(N,X,Y,Z) :- 
         N>1, 
         M is N-1, 
         move(M,X,Z,Y), 
         move(1,X,Y,_), 
         move(M,Z,Y,X).  
