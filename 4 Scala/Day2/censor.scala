/** Write a Censor trait with a method that will replace the curse words Shoot and Darn with
    Pucky and Beans alternatives. Use a map to store the curse words and their alternatives.
*/

trait Censor {
    def filter(text:String) = 
        replacements.foldLeft(text)((text, replacement) => text.replaceAll(replacement._1, replacement._2))
    
    val replacements = Map("Shoot" -> "Pucky", "Darn" -> "Beans") 
}

class Host extends Censor

val host = new Host;
println(host.filter("Shoot Darn Heck Gosh Fudge"))