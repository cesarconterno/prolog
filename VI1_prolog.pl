%1a questao
% Essa função retorna true se X é membro da lista

membrou(X,[X|_]) :- !.
membrou(X,[_|Y]) :- membrou(X,Y),!.

% Determina e exibe a interseção de duas listas
inter(_, [], []).
inter([], _, []).

inter([A|B], L2, [A|L]):-
    membrou(A, L2),
    inter(B, L2, L), !.

inter([_|B], L2, L):-
    inter(B, L2, L).

intersecao(L1, L2):-
    inter(L1, L2, L),
    write(L).
% COMANDO: intersecao(lista1, lista2).

% prog(L,M) :- intersecao()




%2a questao

retirar_todas(_,[],[]).
retirar_todas(E,[E|C],L) :- retirar_todas(E,C,L).
retirar_todas(E,[E1|C],[E1|C1]) :- E \== E1, retirar_todas(E,C,C1).

retirar_rep([],[]).
retirar_rep([E|C],[E|C1]) :- retirar_todas(E,C,L), retirar_rep(L,C1).
prog(L,M,P) :- inter(L,M,N), retirar_rep(N,P).


%3a questao

membro(X,[X|_]):-!.
membro(X,[_|Y]):-membro(X,Y),!.
%definindo p
p(A,B,X,Y):-igual(A,B,X),dif(A,B,Z),Y is Z-X.

igual([],[],X):- X is 0.
igual([Y|A],[Y|B],X):-!,igual(A,B,Z) ,X is Z+1.
igual([_|A],[_|B],X):-!,igual(A,B,X).

dif([],_,X):- X is 0.
dif([Y|A],B,X):-membro(Y,B),!,dif(A,B,Z),X is Z+1.
dif([_|A],B,X):-!,dif(A,B,X).




%4a questao

membros(X,[X|_]):-!.
membros(X,[_|Y]):-membros(X,Y),!.
%definindo ps

ps(A,B,X,Y):-iguals(A,B,X),difs(A,B,Z),Y is Z-X.

iguals([],[],X):- X is 0.
iguals([Y|A],[Y|B],X):-!,iguals(A,B,Z) ,X is Z+1.
iguals([_|A],[_|B],X):-!,iguals(A,B,X).

difs([],_,X):- X is 0.
difs([Y|A],B,X):-membros(Y,B),!,difs(A,B,Z),X is Z+1.
difs([_|A],B,X):-!,difs(A,B,X).

% COMANDO: ps([a,a,a,d],[a,a,b,d],X,Y).




%5a questao

lista([]) :-!.
lista([_|L]) :- lista(L),!.

append1([],Y,Y).
append1([X|R],Y,[X|T]):- append1(R,Y,T).

flat([],[]).
flat([A|L],[A|M]):- not(lista(A)),flat(L,M).
flat([A|L],M):- lista(A),append1(A,L,N),flat(N,M).




%6a questao

permuta(Lista,[H|Permutada]):-
  deleta(H,Lista,Resto),
  permuta(Resto,Permutada),
  permuta([],[]).

deleta(X,[X|T],T).
deleta(X,[H|T],[H|NT]):-
  deleta(X,T,NT).
