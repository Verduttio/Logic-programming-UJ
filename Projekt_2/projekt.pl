create_row(0, []) :- !.
create_row(W, [' '|T]) :-
    NewW is W - 1,
    create_row(NewW, T).

canvas(_, 0, []) :- !.
canvas(W, H, [Row|T]) :-
    H > 0,
    create_row(W, Row),
    NewH is H - 1,
    canvas(W, NewH, T).

%------------2----------
point(S1, [X, Y], Z, S2) :-
    update_row(S1, X, Y, Z, S2).

update_row([Row|T], X, 0, Z, [RowNew|T]) :-
    update_element(Row, X, Z, RowNew), !.
update_row([H|T], X, Y, Z, [H|TNew]) :-
    Y > 0,
    NewY is Y - 1,
    update_row(T, X, NewY, Z, TNew).

update_element([_|T], 0, Z, [Z|T]) :- !.
update_element([H|T], Pos, Z, [H|TNew]) :-
    Pos > 0,
    NewPos is Pos - 1,
    update_element(T, NewPos, Z, TNew).

%------------3------------
draw_horizontal_line(S1, Y, X1, X2, Z, S2) :-
    X1 =< X2,
    point(S1, [X1, Y], Z, S3),
    NewX1 is X1 + 1,
    draw_horizontal_line(S3, Y, NewX1, X2, Z, S2).
draw_horizontal_line(S, _, X1, X2, _, S) :- 
    X1 > X2.

draw_vertical_line(S1, X, Y1, Y2, Z, S2) :-
    Y1 =< Y2,
    point(S1, [X, Y1], Z, S3),
    NewY1 is Y1 + 1,
    draw_vertical_line(S3, X, NewY1, Y2, Z, S2).
draw_vertical_line(S, _, Y1, Y2, _, S) :- 
    Y1 > Y2.

draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2) :-
    point(S1, [X1, Y1], Z, S3),
    NextX is X1 + sign(X2 - X1),
    NextY is Y1 + sign(Y2 - Y1),
    (NextX =:= X2, NextY =:= Y2 -> point(S3, [X2, Y2], Z, S2); draw_diagonal_line(S3, NextX, NextY, X2, Y2, Z, S2)).

line(S1, [X1, Y1], [X2, Y2], Z, S2) :-
    ( X1 =:= X2 -> (Y1 =< Y2 -> draw_vertical_line(S1, X1, Y1, Y2, Z, S2); draw_vertical_line(S1, X1, Y2, Y1, Z, S2));
      Y1 =:= Y2 -> (X1 =< X2 -> draw_horizontal_line(S1, Y1, X1, X2, Z, S2); draw_horizontal_line(S1, Y1, X2, X1, Z, S2));
      abs(X1 - X2) =:= abs(Y1 - Y2) -> draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2) ).

%------------4------------
poly(S1, [P1|Rest], Z, S2) :-
    append([P1|Rest], [P1], CompletePoints),
    draw_poly(S1, CompletePoints, Z, S2).

draw_poly(S1, [P1, P2], Z, S2) :-
    line(S1, P1, P2, Z, S2).
draw_poly(S1, [P1, P2 | Rest], Z, S2) :-
    line(S1, P1, P2, Z, S3),
    draw_poly(S3, [P2 | Rest], Z, S2).

%------------5------------
clean(S1, X1, Y1, X2, Y2, S2 ) :-
    Y1 < Y2 -> cleaning(S1, X1, Y1, X2, Y2, S2); cleaning(S1, X2, Y2, X1, Y1, S2).

cleaning(S, _, Y1, _, Y2, S) :-
    Y1 > Y2.

cleaning(S1, X1, Y1, X2, Y2, S2) :-
    Y1 =< Y2,
    line(S1, [X1, Y1], [X2, Y1], ' ', S3),
    NewY1 is Y1 + 1,
    cleaning(S3, X1, NewY1, X2, Y2, S2).

%------------6------------
copy(S1, X, Y, [Row|Rest], S3) :-
    copy_row(S1, X, Y, Row, S2),
    NewY is Y + 1,
    copy(S2, X, NewY, Rest, S3).

copy(S, _, _, [], S) :- !.

copy_row(S1, X, Y, [H|T], S2) :-
    point(S1, [X, Y], H, S3),
    NewX is X + 1,
    copy_row(S3, NewX, Y, T, S2).

copy_row(S, _, _, [], S) :- !.
