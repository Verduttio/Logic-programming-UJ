create_row(0, []) :- !.
create_row(W, [' '|T]) :-
    New_W is W - 1,
    create_row(New_W, T).

canvas(_, 0, []) :- !.
canvas(W, H, [Row|T]) :-
    H > 0,
    create_row(W, Row),
    New_H is H - 1,
    canvas(W, New_H, T).

%------------2----------
point(S1, [X, Y], Z, S2) :-
    update_row(S1, X, Y, Z, S2).

update_row([Row|T], X, 0, Z, [Row_New|T]) :-
    update_element(Row, X, Z, Row_New), !.
update_row([H|T], X, Y, Z, [H|T_New]) :-
    Y > 0,
    New_Y is Y - 1,
    update_row(T, X, New_Y, Z, T_New).

update_element([_|T], 0, Z, [Z|T]) :- !.
update_element([H|T], Pos, Z, [H|T_New]) :-
    Pos > 0,
    New_Pos is Pos - 1,
    update_element(T, New_Pos, Z, T_New).

%------------3------------
% Predykat do rysowania linii poziomej
draw_horizontal_line(S1, Y, X1, X2, Z, S2) :-
    X1 =< X2,
    point(S1, [X1, Y], Z, S3),
    NewX1 is X1 + 1,
    draw_horizontal_line(S3, Y, NewX1, X2, Z, S2).
draw_horizontal_line(S, _, X, X, _, S) :- !.

% Predykat do rysowania linii pionowej
draw_vertical_line(S1, X, Y1, Y2, Z, S2) :-
    Y1 =< Y2,
    point(S1, [X, Y1], Z, S3),
    NewY1 is Y1 + 1,
    draw_vertical_line(S3, X, NewY1, Y2, Z, S2).
draw_vertical_line(S, _, Y, Y, _, S) :- !.

% Predykat do rysowania linii skośnej
draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2) :-
    point(S1, [X1, Y1], Z, S3),
    NextX is X1 + sign(X2 - X1),
    NextY is Y1 + sign(Y2 - Y1),
    (NextX =:= X2, NextY =:= Y2 -> point(S3, [X2, Y2], Z, S2); draw_diagonal_line(S3, NextX, NextY, X2, Y2, Z, S2)).

% Predykat główny do rysowania linii
line(S1, [X1, Y1], [X2, Y2], Z, S2) :-
    ( X1 =:= X2 -> draw_vertical_line(S1, X1, Y1, Y2, Z, S2);
      Y1 =:= Y2 -> draw_horizontal_line(S1, Y1, X1, X2, Z, S2);
      abs(X1 - X2) =:= abs(Y1 - Y2) -> draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2) ).
