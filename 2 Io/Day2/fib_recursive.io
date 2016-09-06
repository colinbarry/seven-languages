# Solve the problem (ie, Fibonacci) with recursion.

fib := method(nth, 
    if (nth == 1 or nth == 2, 1, fib(nth - 1) + fib(nth - 2))
)

fib(24) println