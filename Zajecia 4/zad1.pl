app([], L, L).
app([H|T], L, W) :- app(T, L, W1), W = [H|W1].

ostatni_element([X], X).
ostatni_element([_|T], X) :- ostatni_element(T, X).

prefiks([], _).
prefiks([H|T], [H|T1]) :- prefiks(T, T1).

podlista([], _).
podlista([H|T], [H|T1]) :- prefiks(T, T1).
podlista([H|T], [_|T1]) :- podlista([H|T], T1).


wstaw(X, [], [X]).
wstaw(X, [H|T], W) :- X @=< H, app([X], [H|T], W).
wstaw(X, [H|T], W) :- X @> H, wstaw(X, T, W1), app([H], W1, W).

sortuj([], []).
sortuj([H|T], W) :- sortuj(T, W1), wstaw(H, W1, W).

podlista2([], _).
podlista2([H|T], [H|T1]) :- podlista2(T, T1).
podlista2([H|T], [_|T1]) :- podlista2([H|T], T1).



