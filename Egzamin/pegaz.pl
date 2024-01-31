intersect([A|ARest], [B|BRest], [A|CRest]) :-
    A = B, 
    intersect(ARest, BRest, CRest).

intersect([_|ARest], [_|BRest], C) :-
    intersect(ARest, BRest, C).

intersect([], _, []).
intersect(_, [], []).



% test intersect([a,b,c,d,a,b], [a,d,c,d,a,x,y], C).

% Zadanie 2
dot(A, B, C) :- dot(A, B, 0, C).

dot([], [], C, C).

dot([A|ARest], [B|BRest], Cl, C) :-
    Cl1 is Cl + A*B,
    dot(ARest, BRest, Cl1, C).

% test dot([1,2,3], [4,-1,1], Y).

a(3). a(2). a(1).
b(1). b(2). b(3).

a :- a(X), write(X), X>1, b(Y), write(Y), Y>X, false.

% zadanie 6
x(A, B) :- x(A, L-L, B-[]).
x([], B, B).
x([H|T], A-[H|B], L) :- x(T, A-B, L).

abc([_,X,_|_], [X,X]).
abc([X,Y|T], [X,Y,X,Y|T]).
abc([X,Y], [Y,X]).

%% Egzamin 2
split([H|T], [H|A], B) :- 
    H > 5,
    split(T, A, B).

split([H|T], A, [H|B]) :-
    H < -3,
    split(T, A, B).

split([H|T], A, B) :- 
    H =< 5,
    H >= -3,
    split(T, A, B).

split([], [], []).


suma(L, S) :- suma(L, 0, S).

suma([H|T], Ac, S) :-
    H > 0,
    AcNew is Ac + H,
    suma(T, AcNew, S).

suma([H|T], Ac, S) :-
    H =< 0,
    suma(T, Ac, S).

suma([], S, S).


%8
contains([H|T], X) :-
    H =:= X, !.

contains([H|T], X) :-
    H =\= X,
    contains(T, X).


delRowsB(X, [Row|T], [Row|R]):-
    contains(Row, X),
    delRowsB(X, T, R).

delRowsB(X, [Row|T], R) :- 
    \+ contains(Row, X),
    delRowsB(X, T, R).

delRowsB(X, [], []).


%split([0,1,2,0,0,1,2,3], L). => L=[ [], [1,2], [], [1,2,3]]
% split([1,2,0,0,1,2,3,0], L). => L=[ [1,2], [], [1,3,3],[]]
% split([0], L). => L=[ [], []]
% split([], L). => L=[ [] ]


split(A, L) :- split(A, L, [], []).
split([], L, Acc1, Acc2) :-
    append(Acc1, [Acc2], L).

split([0 | Tail], L, Acc1, Acc2) :-
    append(Acc1, [Acc2], Acc12),
    split(Tail, L, Acc12, []).

split([A | Tail], L, Acc1, Acc2) :-
    A \= 0,
    append(Acc2, [A], Acc22),
    split(Tail, L, Acc1, Acc22).

my_append([], List, List).
my_append([Head|Tail1], List, [Head|Tail2]) :-
    my_append(Tail1, List, Tail2).