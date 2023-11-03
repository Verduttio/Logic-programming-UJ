liczba(0).
liczba(s(X)) :- liczba(X).

odd(s(0)).
odd(s(s(X))) :- odd(X).

mniejszy(0, s(0)).
mniejszy(s(X), s(Y)) :- mniejszy(X, Y).

dodaj(0, Y, Y).
dodaj(s(X), Y, s(Z)) :- dodaj(X, Y, Z).

% mnozenie przez dodawanie
% (x+1)*y = x*y + y
mnoz(0, _, 0).
mnoz(s(X), Y, Z) :- mnoz(X, Y, W), dodaj(W, Y, Z).

krawedz(a, b).
krawedz(b, c).
krawedz(a, c).
sciezka_peano(X, Y, s(0)) :- krawedz(X, Y).
sciezka_peano(X, Y, s(N)) :- krawedz(X, Z), sciezka_peano(Z, Y, N).
