% Factorial

fact(0, 0).
fact(1, 1).
fact(N, Result) :-
    N >= 2, 
    V is N - 1,
    fact(V, T),
    Result is T * N.
