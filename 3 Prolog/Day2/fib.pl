% Fibonacci sequence generator

fib(0, 0).
fib(1, 1).
fib(N, Result) :- 
    N > 1,
    N2 is N - 2,
    N1 is N - 1,
    fib(N2, X),
    fib(N1, Y), 
    Result is X + Y.
