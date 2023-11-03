collatz1(1) :- writeln(1).
collatz1(N) :- N mod 2 =:= 0, N1 is N // 2, writeln(N), collatz1(N1).
collatz1(N) :- N mod 2 =:= 1, N1 is 3 * N + 1, writeln(N), collatz1(N1).

collatz2(1, 1).
collatz2(X, N) :- X mod 2 =:= 0, X1 is X // 2, collatz2(X1, N1), N is N1 + 1.
collatz2(X, N) :- X mod 2 =:= 1, X1 is 3 * X + 1, collatz2(X1, N1), N is N1 + 1.

binom(_, 0, 1).
binom(N, N, 1).
binom(N, K, X) :- N > 0, K>0,
                N1 is N-1, 
                K1 is K-1,
                binom(N1, K1, A), 
                binom(N1, K, B),
                X is A + B.