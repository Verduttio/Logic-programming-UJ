% Sprawdza, czy dany punkt (X, Y) znajduje się w granicach labiryntu  -- to jest OK!
valid_point(Labyrinth, X, Y) :-
    length(Labyrinth, Rows),
    length(Labyrinth, Cols),
    X > 0, X =< Rows,
    Y > 0, Y =< Cols,
    nth1(X, Labyrinth, Row),
    nth1(Y, Row, Cell),
    Cell == o.

not_visited(Point, Path) :-
    \+ member(Point, Path).


path_neighbour(Labyrinth, [X, Y], [X, Y1]) :-
    Y1 is Y + 1,
    valid_point(Labyrinth, X, Y1).

path_neighbour(Labyrinth, [X, Y], [X, Y1]) :-
    Y1 is Y - 1,
    valid_point(Labyrinth, X, Y1).

path_neighbour(Labyrinth, [X, Y], [X1, Y]) :-
    X1 is X + 1,
    valid_point(Labyrinth, X1, Y).

path_neighbour(Labyrinth, [X, Y], [X1, Y]) :-
    X1 is X - 1,
    valid_point(Labyrinth, X1, Y).




path_helper(_, End, End, Path_tmp, Path_tmp).

path_helper(Labyrinth, [X, Y], End, Path_tmp, Path) :-
    path_neighbour(Labyrinth, [X, Y], [X_New, Y_New]),
    not_visited([X_New, Y_New], Path_tmp),
    append(Path_tmp, [[X_New, Y_New]], NewPath),
    path_helper(Labyrinth, [X_New, Y_New], End, NewPath, Path).

path(Labyrinth, Start, End, Path) :-
    path_helper(Labyrinth, Start, End, [Start], Path).
    