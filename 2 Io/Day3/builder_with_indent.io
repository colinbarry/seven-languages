# Enhance the XML program to add spaces to show the indentation structure.

Builder := Object clone
Builder level := 0

Builder forward := method(
    indent := "    " repeated(level)
    
    writeln(indent, "<", call message name, ">")
    
    level = level + 1
    
    call message arguments foreach(
        arg,
        content := self doMessage(arg, level)
        if(content type == "Sequence", writeln(indent, content))
    )
    
    level = level - 1
    
    writeln(indent, "</", call message name, ">")
)

Builder ul(
    li("Io"),
    li("Lua"),
    li(p("Javascript"))
)