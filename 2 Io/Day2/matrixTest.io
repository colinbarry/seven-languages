MatrixTest := UnitTest clone do(

    setUp := method(
        self matrix := Matrix clone
        matrix dim(2, 4)
        matrix set(0, 0, 2)
        matrix set(1, 0, 3)
        matrix set(0, 1, 5)
        matrix set(1, 1, 7)
        matrix set(0, 2, 11)
        matrix set(1, 2, 13)
        matrix set(0, 3, 17)
        matrix set(1, 3, 19) 
    )
    
    testGet := method(
        assertEquals(2, matrix get(0, 0))
        assertEquals(3, matrix get(1, 0))
        assertEquals(5, matrix get(0, 1))
        assertEquals(7, matrix get(1, 1))
        assertEquals(11, matrix get(0, 2))
        assertEquals(13, matrix get(1, 2))
        assertEquals(17, matrix get(0, 3))
        assertEquals(19, matrix get(1, 3))
    )

    testTranspose := method(
        new_matrix := matrix transpose
        assertEquals(2, new_matrix get(0, 0))
        assertEquals(5, new_matrix get(1, 0))
        assertEquals(11, new_matrix get(2, 0))
        assertEquals(17, new_matrix get(3, 0))
        assertEquals(3, new_matrix get(0, 1))
        assertEquals(7, new_matrix get(1, 1))
        assertEquals(13, new_matrix get(2, 1))
        assertEquals(19, new_matrix get(3, 1))
    )
    
    testPersistence := method(
        matrix writeToFile("matrix.txt")
        restored_matrix := Matrix readFromFile("matrix.txt")
        assertEquals(2, matrix get(0, 0))
        assertEquals(3, matrix get(1, 0))
        assertEquals(5, matrix get(0, 1))
        assertEquals(7, matrix get(1, 1))
        assertEquals(11, matrix get(0, 2))
        assertEquals(13, matrix get(1, 2))
        assertEquals(17, matrix get(0, 3))
        assertEquals(19, matrix get(1, 3))
    )
)

MatrixTest run