/** Load the curse words and alternatives from a file.
*/

import scala.io.Source

trait Censor {
    def filter(text:String) = 
        replacements.foldLeft(text)((text, replacement) => text.replaceAll(replacement._1, replacement._2))
    
    var replacements = Map[String, String]()
    for (line <- Source.fromFile("words.txt").getLines()) {
        var replacement = line.split(" ")
        if (replacement.length >= 2)
            replacements += replacement(0) -> replacement(1)
    }
}

class Host extends Censor

val host = new Host;
println(host.filter("Shoot Darn Heck Gosh Fudge"))