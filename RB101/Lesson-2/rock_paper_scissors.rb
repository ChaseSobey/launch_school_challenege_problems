# ROCK PAPER SCISSORS GAME

# Ask user to play rock paper or scissors
# Computer makes a move
# Then winner is displayed

VALID_CHOICES = ['rock', 'paper', 'scissors']

# Method Definitions

def prompt(words)
  puts "=> #{words}"
end 

def display_results(player_choice, computer_choice)
  if player_choice == computer_choice
    prompt('Its a tie!!!')
  elsif (player_choice == 'rock' && computer_choice == 'scissors') || 
    (player_choice == 'paper' && computer_choice == 'rock') || 
    (player_choice == 'scissors' && computer_choice == 'paper')
    prompt('You won!')
  else
    prompt("Computer won!")
  end 
end 

player_choice = ''
loop do 
  
  loop do 
    prompt("Please choose #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp.downcase
  
    if VALID_CHOICES.include?(player_choice.downcase)
      break
    else
      prompt("Thats not a valid choice")
    end 
  end 
  
  computer_choice = VALID_CHOICES.sample
  
  prompt("you chose: #{player_choice}, the computer chose: #{computer_choice}")
  
  display_results(player_choice, computer_choice)
  
  prompt("Play again? (y/n)")
  play_again = gets.chomp
  
  break unless play_again.downcase == 'y'
end 

prompt("Thanks for playing!")