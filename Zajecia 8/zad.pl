:- use_module(library(clpfd)).

z1a([T,E,S,T]+[J,E,S,T] = [S,U,P,E,R]) :-
        Vars = [T,E,S,J,U,P,R],
        Vars ins 0..9,
        T #\= 0, J #\= 0, S #\= 0,
        all_different(Vars),
        T*1000 + E*100 + S*10 + T +
        J*1000 + E*100 + S*10 + T
        #=
        S*10000 + U*1000 + P*100 + E*10 + R.

z2a([D,O,M]*[D,O,M] = [M,I,A,S,T,O]) :-
        Vars = [D,O,M,I,A,S,T],
        Vars ins 0..9,
        D #\= 0, M #\= 0,
        all_different(Vars),
        D1 #= (D*100 + O*10 + M),
        D1 * D1
        #=
        M*100000 + I*10000 + A*1000 + S*100 + T*10 + O.

z3a([X,Y]) :-
    Vars = [X,Y],
    Vars ins 1..9,
    all_different(Vars),
    X + 
    Y*1000 + Y*100 + Y*10 + Y +
    Y*1000 + Y*100 + Y*10 + Y +
    Y*1000 + Y*100 + Y*10 + Y +
    Y*1000 + Y*100 + Y*10 + Y
    #=
    X*10000 + Y*1000 + Y*100 + Y*10 + Y,
    labeling([], Vars).





