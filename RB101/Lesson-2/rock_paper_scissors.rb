#ROCK PAPER SCISSORS GAME

# Ask user to play rock paper or scissors
# Computer makes a move
# Then winner is displayed

VALID_CHOICES = %w(rock paper scissors)
# Method Definitions

def prompt(words)
  puts "=> #{words}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt('You won!')
  elsif win?(computer_choice, player_choice)
    prompt('Computer won!')
  else
    prompt("It's a tie!!")
  end
end
player_choice = ''
loop do
  loop do
    prompt("Please choose #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp.downcase

    break if VALID_CHOICES.include?(player_choice)

    prompt('Thats not a valid choice')
  end

  computer_choice = VALID_CHOICES.sample

  prompt("you chose: #{player_choice}, the computer chose: #{computer_choice}")

  display_results(player_choice, computer_choice)

  prompt('Play again? (y/n)')
  play_again = gets.chomp

  break unless play_again.downcase == 'y'
end

prompt('Thanks for playing!')
