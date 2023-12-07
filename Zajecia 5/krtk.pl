tail([], []).
tail([H|T1], [H|T2]) :- tail2(T1, T2).
tail([H1|T1], [H2|T2]) :- tail(T1, [H2|T2]).

tail2([H|T1], [H|T2]) :- tail2(T1, T2).
tail2([], []).


even1([], 0).
even1([H|T], E) :- (H mod 2) =:= 0, even1(T, E1), E is E1 + 1.
even1([H|T], E) :- (H mod 2) =:= 1, even1(T, E).