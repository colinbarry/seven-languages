/** Make the sizer follow the links on a given page and load them as well.
*/

import scala.io._
import scala.actors._
import Actor._

object PageLoader {
    def getPageDetails(url : String) : (Int, Int) = {
        println("Loading url " + url)
        val linkRegex = """<a\s+(?:[^>]*?\s+)?href="([^"]*.(htm|html))"""".r
        val source = Source.fromURL(url).mkString
        var length = source.length
        var numLinks = 0
        
        linkRegex.findAllIn(source).matchData foreach { 
            m => {
                val linkedUrl = m.group(1)
                numLinks += 1
                
                val absoluteUrl = linkedUrl match {
                    case s if s.startsWith("/") => url + linkedUrl
                    case _ => linkedUrl
                }
                
                println("Loading url " + absoluteUrl)
                length += Source.fromURL(absoluteUrl).mkString.length
            }
        }
        
        return (length, numLinks)
    }
}

val urls = List("http://www.apple.com/",
                "http://www.reddit.org/",
                "http://www.google.com/",
                "http://www.cnn.com/")
                
def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method();
    val end = System.nanoTime
    println("Method took " + (end - start) / 1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
    for(url <- urls) {
        val results = PageLoader.getPageDetails(url)
        println("URL " + url + ": size  = " + results._1 + ", numLinks = " + results._2) 
    }
}

def getPageSizeConcurrently() = {
    val caller = self
    for (url <- urls) {
        actor { caller ! (url, PageLoader.getPageDetails(url)) }
    }
    
    for (i <- 1 to urls.size) {
        receive {
            case(url, (size, numLinks)) =>
                println("URL " + url + ": size  = " + size + ", numLinks = " + numLinks) 
        }
    }
}

println("Sequential run")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }
