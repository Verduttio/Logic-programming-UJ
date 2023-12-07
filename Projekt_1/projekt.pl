path(Labyrinth, Start, End, Path) :-
    path_helper(Labyrinth, Start, End, [Start], Path).

path_helper(_, End, End, Path_tmp, Path_tmp).
path_helper(Labyrinth, [X, Y], End, Path_tmp, Path) :-
    path_neighbour(Labyrinth, [X, Y], [X_New, Y_New]),
    not_visited([X_New, Y_New], Path_tmp),
    append(Path_tmp, [[X_New, Y_New]], NewPath),
    path_helper(Labyrinth, [X_New, Y_New], End, NewPath, Path).

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

valid_point(Labyrinth, X, Y) :-
    length(Labyrinth, Rows),
    length(Labyrinth, Cols),
    X > 0, X =< Rows,
    Y > 0, Y =< Cols,
    nth1(X, Labyrinth, Row),
    nth1(Y, Row, Cell),
    Cell == o.

% ----------------- 2 -----------------
display_lab([]).
display_lab([H|T]) :-
    display_row(H),
    display_lab(T).

display_row([]) :- nl.
display_row([H|T]) :-
    (H == o -> write(' '); write('x')),
    display_row(T).

% ----------------- 3 -----------------
display_lab(Labyrinth, Path) :-
    display_lab(Path, Labyrinth, 1).

display_lab(_, [], _).
display_lab(Path, [H|T], X) :-
    display_row_with_path(Path, H, X, 1),
    X_New is X + 1,
    display_lab(Path, T, X_New).

display_row_with_path(_, [], _, _) :- nl.
display_row_with_path(Path, [H|T], X, Y) :-
    (member([X, Y], Path) -> write('.'); H == o -> write(' '); write('x')),
    Y_New is Y + 1,
    display_row_with_path(Path, T, X, Y_New).