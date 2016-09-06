/** Write a game that will take a tic-tac-toe board with X, O and blank characters and detect
    the winner or whether there is a tie or no winner yet.
   
    Bonus problem: Let two players play tic-tac-toe.
*/

class Board {
    var cells : Array[String] = Array.fill(9)(" ")
 
    /** Sets a cells value.
    */
    def setCell(index:Int, value:String) {
        cells(index) = value;
    }
    
    /** Returns a cells value. 
    */
    def getCell(index:Int) : String = {
        return cells(index);
    }
    
    /** Prints the board state. 
    */
    def display() {
        val nl = sys.props("line.separator");
        println(cells(0) + "|" + cells(1) + "|" + cells(2));
        println("-----");
        println(cells(3) + "|" + cells(4) + "|" + cells(5));
        println("-----");
        println(cells(6) + "|" + cells(7) + "|" + cells(8));
        println;
    }
    
    /** Checks the board, returning the player token if either player has won, "tie" in the case of tie, 
    * otherwise an empty string is the game can continue. */
    def checkBoard() : String = {
        val lines = Array(  (0, 1, 2), (3, 4, 5), (6, 7, 8),    // winning rows
                            (0, 3, 6), (1, 4, 7), (2, 5, 8),    // winning columns
                            (0, 4, 8), (2, 4, 6));              // winning diagonals.
        
        
        for(line <- lines) {
            val c0 = cells(line._1);
            val c1 = cells(line._2);
            val c2 = cells(line._3);
            
            if (c0 != " " && c0 == c1 && c1 == c2)
                return c0;
        }
        
        // If there are any empty cells, the  has not yet end,
        for (cell <- cells) {
            if (cell == " ")
                return "";
        }
        
        return "tie";
    }
    
    def isTie() : Boolean = {
        return false;
    }
}


var board = new Board
board.display()

var player:String = "O";
var state = "";
    
while (state == "") {
    var isValidMove = false;
    var position:Int = 0;
    while(!isValidMove) {
        println(player, " please enter your move (0 - 8)");
        position = readInt();
    
        if (board.getCell(position) != " ")
            println ("That position has already been taken.");
        else
            isValidMove = true
    }
            
    board.setCell(position, player);
    board.display()
    
    state = board.checkBoard();
    if (state == "tie")
        println("It is a tie.")
    else if (state == "X" || state == "O")
        println(state, " wins")
    else
    {
        if (player == "X")
            player = "O"
        else
            player = "X";
    }
}
