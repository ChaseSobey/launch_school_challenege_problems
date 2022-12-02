### TIC TAC TOE ###
=begin
1. Display the initial empty 3x3 board
2. Ask the user to mark a square
3. Computer marks a square
4. Display the updated board state
5. If winner, Display winner
6. If board is full, display tie
7. If neither winner, nor board full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!
=end

# ---------------------- CONSTANT DEFINITIONS ----------------- #
EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_MOVES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # Rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # Columns
                [[1, 5, 9], [3, 5, 7]]              # Diagonals
# ---------------------- METHOD DEFINITIONS -------------------- #

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  puts ''
  puts '     |     |   '
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |   '
  puts '-----+-----+-----'
  puts '     |     |   '
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |   '
  puts '-----+-----+-----'
  puts '     |     |   '
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |   '
end 

def initialize_board
  new_board = {}
  (1..9).each do |num|
    new_board[num] = EMPTY_MARKER
  end
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == EMPTY_MARKER }
end

def joinor(brd, spacing = ', ', final_space = 'or ')
  joined = ''
  numbers = empty_squares(brd)
  numbers.each do |num|
    if num == numbers[-1]
      joined << (final_space + num.to_s)
    else
      joined << num.to_s + spacing
    end
  end
  joined
end


def player_places_piece!(brd)
  move = ''
  
  loop do
    prompt "Choose a position to place a piece: #{joinor(brd)}"
    move = gets.chomp.to_i
    
    break if empty_squares(brd).include?(move)
    prompt 'Sorry, thats not a valid choice'
  end
  
  brd[move] = PLAYER_MARKER
end 

def find_at_risk_square(brd, marker)
  at_risk_square = nil
  WINNING_MOVES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      at_risk_square = brd.select { |k, v| line.include?(k) && v == EMPTY_MARKER }.keys.first
    else
      nil
    end
  end
  at_risk_square
end


def computer_places_piece!(brd)
  computer_move = nil

  if !computer_move
    computer_move = find_at_risk_square(brd, COMPUTER_MARKER)
    brd[computer_move] = COMPUTER_MARKER
  end
  
  if !computer_move
    computer_move = find_at_risk_square(brd, PLAYER_MARKER)
    brd[computer_move] = COMPUTER_MARKER
  end
  
  if brd[5] == EMPTY_MARKER
    computer_move = 5
    brd[computer_move] = COMPUTER_MARKER
  end

  if !computer_move
  computer_move = empty_squares(brd).sample
   brd[computer_move] = COMPUTER_MARKER
  end

  brd[computer_move]
  
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_MOVES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
      brd[line[1]] == PLAYER_MARKER &&
      brd[line[2]] == PLAYER_MARKER
      return 'Player'
      
    elsif brd[line[0]] == COMPUTER_MARKER &&
      brd[line[1]] == COMPUTER_MARKER &&
      brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def alternate_player(current)
  if current.start_with?('c')
    current = 'p'
  else
    current = 'c'
  end
  current
end

def place_piece!(brd, current_player)
  if current_player == 'p'
    player_places_piece!(brd)
  elsif current_player == 'c'
    computer_places_piece!(brd)
  end
end


# ---------------------- START OF CODE -------------------------#
player_wins = 0
computer_wins = 0
current_player = ''

loop do
  board = initialize_board
  
  loop do
    prompt 'Who should play first move? (Player or Computer)'
    current_player = gets.chomp.downcase
    
    current_player = 'p' if current_player.start_with?('p')
    current_player = 'c' if current_player.start_with?('c')
    
    break if current_player.start_with?('p', 'c')
    prompt 'You must pick a valid starting player!'
  end
  
  display_board(board)

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)

  end
  
  if detect_winner(board) == 'Player'
    player_wins += 1
  elsif detect_winner(board) == 'Computer'
    computer_wins += 1
  end
  
  display_board(board)
  if detect_winner(board)
    prompt "#{detect_winner(board)} won!!"
  else
    prompt "It's a tie!!"
  end
  prompt "Player wins: #{player_wins}, Computer wins: #{computer_wins}"
  if player_wins == 3
    prompt 'Player is the Grand Champion!!'
    break
  elsif computer_wins == 3
    prompt 'Computer is the Grand Champion!!'
    break
  end
  
  prompt 'Play again? (y or n)'
  
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end

prompt 'Thanks for playing!!'