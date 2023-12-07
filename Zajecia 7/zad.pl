f([], L-L).
f([H|T], A-D) :-!,
    f(H, A-B), f(T, B-D).
f(A, [A-L]-L).


%mirror 
m([], []).
m([H|T], M) :- m(T, TM), append([H|TM], [H], M).

app(A-B, B-C, A-C).
m2([], L-L).
m2([H|T], M) :- m2(T, X-Y), 
                app([H|Z]-Z, X-Y, Z1-Z2),
                app(Z1-Z2, [H|ZZ]-ZZ, M).

m3([], L-L).
m3([H|T], [H|X]-ZZ) :- m3(T, X-[H|ZZ]).


%rotate
rot([], []).
rot([H|T], R) :- rot(T, RT), append(RT, [H], R).


rot2([H|T]-L, W) :- app(T-L, [H|X]-X, W).
rot2(L-L, L-L).

rot3([H|T]-[H|X], T-X).
rot3(L-L, L-L).



% Predykat pomocniczy is_positive/1
is_positive(X) :- X > 0.

% Predykat only_positive/2
only_positive([], L-L).
only_positive([H|T], [H|X]-Y) :-
    is_positive(H),
    only_positive(T, X-Y).
only_positive([H|T], P) :-
    \+ is_positive(H),
    only_positive(T, P).