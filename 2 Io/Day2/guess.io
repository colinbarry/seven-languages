# Write a program that gives you ten tries to guess  a random number from 1-100.

value := Random value(100) ceil
guessesLeft := 10

prevGuess := nil

while(guessesLeft > 0,
    guess := File standardInput readLine("Enter guess: ") asNumber
    
    if(guess == value,
        "Congratulations; you have guessed correctly." println
        break
    )
    
    if(prevGuess,
        prevDiff := (value - prevGuess) abs
        currDiff := (value - guess) abs
        
        if(prevDiff < currDiff, "Colder" println)
        if(prevDiff > currDiff, "Warmer" println)
        if(prevDiff == currDiff, "Neither warmer, nor colder." println)
    )    
    
    prevGuess = guess
    
    guessesLeft = guessesLeft - 1
    
    if (guessesLeft == 0,
        "You have ran out of guesses. The number was #{value}." interpolate println
        break
    ) 
)
