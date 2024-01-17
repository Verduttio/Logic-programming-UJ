print_table(Term) :-
    Term =.. [_FuncName|Args],
    print_args(Args).

print_args([]).
print_args([H|T]) :-
    write(H), nl,
    print_args(T).


% subst(S, A, B, W) :- 
%     S =.. L,
%     subst_list(L, A, B, L2),
%     W =.. L2.

% subst_list([], _, _, []).
% subst_list([A|T], A, B, [B|T1]) :-
%     subst_list(T, A, B, T1).
% subst_list([H|T], A, B, [H|T1]) :-
%     H \= A,
%     subst_list(T, A, B, T1).
            
subst(S, A, B, W) :- 
    S =.. [A],
    W =.. [B], !.
subst(S, A, _, S) :-
    S =.. [F], F\=A, !.
subst(S, A, B, W) :-
    S =.. L, 
    subst_list(L, A, B, L2),
    W =.. L2.

subst_list([], _, _, []).
subst_list([H|T], A, B, [H|T1]) :-
    subst(H, A, B, H1),
    subst_list(T, A, B, T1).

odstep(0).
odstep(N) :- write('.'), N1 is N-1, odstep(N1).


r(D) :- r(D, 0).
r(D, N) :- 
    D =.. [d, Label|T],
    odstep(N),
    writeln(Label), N1 is N+1,
    rysuj_liste(T, N1).

rysuj_liste([], _).
rysuj_liste([H|T], N) :- 
    r(H, N),
    rysuj_liste(T, N).  



