sum([], 0).
sum([H|T], S) :- sum(T, S1), S is S1 + H.
% sum([H|T], S) :- S1 is S + H, sum(T, S1).

mnoz([], 1).
mnoz([H|T], P) :- mnoz(T, P1), P is P1 * H.

reverse([], []).
reverse([H|T], R) :- reverse(T, R1), append(R1, [H], R).

pomnoz2([], []).
pomnoz2([H|T], [H1|T1]) :- H1 is H * 2, pomnoz2(T, T1).

podziel2([], []).
podziel2([H|T], [H1|T1]) :- H1 is H / 2, podziel2(T, T1).
