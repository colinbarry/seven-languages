/** Use foldLeft to compute the total size of a list of strings.
*/

val items = List("Alfa", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf")
println(items.foldLeft(0)((size, item) => size + item.length))