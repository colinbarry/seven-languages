# Add a slot called myAverage to a list taht computes the average of all number in a list.

List myAverage := method(
    if (size == 0,
        return nil
    )
        
    total := 0
    foreach(v, 
        if (v type == "Number",
            total = total + v,
            Exception raise("list contains a non-Number element.")
        )
    )
    total / size
)

# Calculate the average of list.
a := list(2, 3, 5, 7, 11, 13, 17)
a myAverage println

# Calculate the average of an empty list, which will be nil
b := list()
b myAverage println

# Catch the thrown exception if the list contains a non-Number type
c := list(1, 2, "3", 4)
e := try(
    c myAverage println
)

e catch(Exception,
    ("Exception caught: " .. e error) println
)