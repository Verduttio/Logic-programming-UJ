suma(0, A, A).
suma(N, A, S) :- N > 0, A1 is A + N, N1 is N - 1, suma(N1, A1, S).
suma(N, S) :- suma(N, 0, S).


silnia(N, S) :- silnia(N, 1, S).
silnia(0, A, A).
silnia(N, A, S) :- N > 0, A1 is A * N, N1 is N - 1, silnia(N1, A1, S).


fib(0, A, _,  A).
fib(N, A1, A2, F) :- N > 0, N1 is N - 1, A3 is A1 + A2, fib(N1, A2, A3, F).
fib(N, F) :- fib(N, 0, 1, F).

przekatna(M, P) :- przekatna(M, 0, P).
przekatna([], _, []).
przekatna([H|T], N, [H1|P]) :- nth0(N, H, H1), N1 is N + 1, przekatna(T, N1, P).

sumy([], X, Y, X, Y).
sumy([H|T], XA, YA, X, Y) :- H > 0, XA1 is XA + H, sumy(T, XA1, YA, X, Y).
sumy([H|T], XA, YA, X, Y) :- H < 0, YA1 is YA + H, sumy(T, XA, YA1, X, Y).
sumy([H|T], XA, YA, X, Y) :- H =:= 0, sumy(T, XA, YA, X, Y).
sumy(L, X, Y) :- sumy(L, 0, 0, X, Y).
