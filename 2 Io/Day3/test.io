# The calling code for Builder needs to be in a different file than the addAssignOperator. 
# see https://github.com/stevedekorte/io/issues/259

Builder ul(
    li({"embeddable": "true"}, "Io"),
    li({"embeddable": "true", "hasOneBasedIndexing": "true"}, "Lua"),
    li(p({"embeddable": "false"}, "Javascript"))
)