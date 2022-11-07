#ROCK PAPER SCISSORS GAME

# Ask user to play rock paper or scissors
# Computer makes a move
# Then winner is displayed

VALID_CHOICES = %w(rock paper scissors spock lizard)
# Method Definitions

def prompt(words)
  puts "=> #{words}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def display_results(player_choice, computer_choice, player_win_counter, computer_win_counter)
  if win?(player_choice, computer_choice)
    prompt('You won!')
    prompt("Player wins: #{player_win_counter}. Computer wins: #{computer_win_counter}")
  elsif win?(computer_choice, player_choice)
    prompt('Computer won!')
    prompt("Player wins: #{player_win_counter}. Computer wins: #{computer_win_counter}")
  else
    prompt("It's a tie!!")
  end
end

player_choice = ''
player_win_count = 0
computer_win_count = 0

loop do
  loop do
    prompt("Please choose of the following: #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp.downcase

    break if VALID_CHOICES.include?(player_choice)

    prompt('Thats not a valid choice')
  end

  computer_choice = VALID_CHOICES.sample

  prompt("you chose: #{player_choice}, the computer chose: #{computer_choice}")
  
  if win?(player_choice, computer_choice)
    player_win_count += 1
  elsif win?(computer_choice, player_choice)
    computer_win_count += 1
  else
  end

  display_results(player_choice, computer_choice, player_win_count, computer_win_count)

  if (player_win_count == 3)
    prompt('Player is the champion!!')
    break
  elsif (computer_win_count == 3)
    prompt('Computer is the champion!!')
    break 
  else
  end

  prompt('Play again? (y/n)')
  play_again = gets.chomp

  break unless play_again.downcase == 'y'
end

prompt('Thanks for playing!')
