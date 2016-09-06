# Write a prototype for a two-dimensional list. The dim(x,y) method should allocate a list of y lists that are
# x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.

# Bonus: write a transpose method to that (new_matrix get(y,x) == matrix get(x, y))

# Write the matrix to a file, and read the matrix from a file.

Matrix := Object clone do (
    init := method(
        self rowList := list()
    )

    dim := method(x, y,
        emptyList := list()
        emptyList setSize(x)
        
        y repeat(rowList append(emptyList clone))
    )

    set := method(x, y, value,
        rowList at(y) atPut(x, value)
    )

    get := method(x, y,
        rowList at(y) at(x)
    )

    transpose := method(
        m2 := Matrix clone
        numRows := rowList size
        numColumns := rowList at(0) size
        
        m2 dim(numRows, numColumns)
        for(r, 0, numRows - 1,
            for(c, 0, numColumns - 1,
                m2 set(r, c, get(c, r))
            )
        )
        
        m2
    )

    trace := method(
        rowList foreach(row,
            row foreach(val,
                (val .. " ") print
            )
            "" println
        )
        "" println
    )
    
    writeToFile := method(filename,        
        File with(filename) remove open write(self serialized) close
    )
    
    readFromFile := method(filename,
        doRelativeFile(filename)
    )
)

