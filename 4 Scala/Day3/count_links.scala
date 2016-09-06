/** Take the sizer application and add a message to count the number of links on the page.
*/

import scala.io._
import scala.actors._
import Actor._

object PageLoader {
    def getPageDetails(url : String) : (Int, Int) = {
        val source = Source.fromURL(url).mkString
        return (source.length, "<a".r.findAllIn(source).length)
    }
}

val urls = List("http://www.bbc.co.uk/",
                "http://www.ebay.com/",
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
