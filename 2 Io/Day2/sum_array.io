# Write a program to add up all of the numbers in a two-dimensional array.

sum2DArray := method(arr,
    total := 0
    arr foreach(row,
        row foreach(val, total = total + val)
    )
    total
)

arr := list(list(2, 3, 5, 7),
            list(11, 13, 17, 19),
            list(23, 29, 31, 37),
            list(41, 43, 47, 53))

sum2DArray(arr) println            
