# Enhance the XML program to handle attributes: if the first argument is a map, add attributes to the
# XML program.

OperatorTable addAssignOperator(":", "atParseAttribute")

Builder := Object clone do (
    level := 0

    curlyBrackets := method(
        call message arguments map(arg,
            self doMessage(arg)
        ) join("")
    )

    atParseAttribute := method(
        key := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
        val := call evalArgAt(1)
        " #{key}=\"#{val}\"" interpolate
    )

    forward := method(
        indent := "    " repeated(level)    
        tagName := call message name
        args := call message arguments
    
        attributes := ""
        if (args size > 0 and args at(0) name == "curlyBrackets",
            arg := args removeFirst
            attributes = doMessage(arg)
        )
        writeln(indent, "<", tagName, attributes, ">")
    
        level = level + 1
    
        args foreach(
            arg,
            content := self doMessage(arg)
            if(content type == "Sequence", writeln(indent .. "    ", content))
        )
    
        level = level - 1
    
        writeln(indent, "</", tagName, ">")
    )
)

# The calling code needs to be in a different file than the addAssignOperator. 
doRelativeFile("test.io")