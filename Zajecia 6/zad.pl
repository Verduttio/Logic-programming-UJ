zgaduj(X,Y) :- X=Y, write('Liczba='), writeln(X).
zgaduj(X,Y) :- X<Y, Z is (X+Y)//2, write('Czy liczba jest większa od '), write(Z), write('? '), read(A), sprawdz_odpowiedz(X,Y,Z,A).

sprawdz_odpowiedz(X,Y,Z,A) :- A = 't', Z1 is Z+1, zgaduj(Z1,Y).
sprawdz_odpowiedz(X,Y,Z,A) :- A \= 't', zgaduj(X,Z).


wygrywa(L, K, X) :- member(X, L), K =< X.
wygrywa(L, K, X) :- member(X, L), K1 is K-X, \+ wygrywa(L, K1, _Y).


%setof(K/L, (numlist(1, 10, LK), member(K, LK), findall(X, wygrywa([2,3,5], K, X), L)), W).
%setof([K,L], (numlist(1, 10, LK), member(K, LK), findall(X, wygrywa([2,3,5], K, X), L)), W).

graj(L, K) :- wygrywa(L, K, X), 
            write("Moj ruch: "), writeln(X),
        (
            X >= K, writeln("Wygralem!")
            ;
            X < K,
            write("Twoj ruch: "), read(Y), 
            K1 is K-X-Y,
            graj(L, K1)
        ).