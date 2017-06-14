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