# Write a program to find the nth Fibonacci number.

fib := method(nth, 
    a := 1 
    b := 1
    for(i, 2, nth,
        c := a + b
        a = b
        b = c
    )
    a
)


fib(23) println