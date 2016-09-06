# Create a list syntax that uses brackets.

squareBrackets := method(
    args := call message arguments

    result := list()
    args foreach(arg,
        result append(
            if (arg name == "squareBrackets",
                doMessage(arg),
                arg
            )
        )
    )
    result
)


a := [2, 3, [5, 7, 11, [13, 17], 23, [], 27]]
a println