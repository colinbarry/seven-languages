# Write a program that picks a random number. Let the player guess the number, telling the player
# whether the guess is too low or too high.

num = rand(10) + 1
correct = false

puts "Enter your guess."
    
while true
    guess = gets().to_i
    
    if guess < num
        puts "Your guess is too low. Try again."
    elsif guess > num
        puts "Your guess is too high. Try again."
    else
        puts "You guessed it!"
        break
    end
end