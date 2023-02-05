#require 'pry'

class Board
  attr_reader :squares
  def initialize
    @squares = {}
    1.upto(9) {|i| @squares[i] = Square.new }
  end
  
  def draw
    puts "     |     |     "
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}   "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |   "
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}   "
    puts "     |     |   "
    puts "-----+-----+-----"
    puts "     |     |   "
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}   "
    puts "     |     |     "
  end
  
  def set_square_at(key, marker)
    @squares[key].marker = marker
  end
  
  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end
  
  def full?
    unmarked_keys.empty?
  end
end



class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker
  
  def initialize
    @marker = INITIAL_MARKER
  end
  
  def unmarked?
    marker == INITIAL_MARKER
  end
  
  def marked?
    marker != INITIAL_MARKER
  end
  
  def to_s
    @marker
  end
end



class Player
  attr_accessor :marker
  def initialize(marker)
    @marker = marker
  end

 
end



class TTTGame
  
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  attr_accessor :board, :human, :computer
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end
  
  def display_welcome_message
    puts 'Welcome to Tic-Tac-Toe!'
  end
  
  def display_board
    puts ''
    board.draw
    puts ''
  end
  
  def human_moves
    puts "Please choose an open square: #{board.unmarked_keys}"
    square = nil
    
    loop do
      square = gets.chomp.to_i
      
      break if board.unmarked_keys.include?(square)
      puts 'You must choose one of the open squares'
    end
    
    board.set_square_at(square, human.marker)
  end
  
  def computer_moves
    #method chain below takes a random number out of the unplayed squares and then sets the corresponding square marker to the computer marker
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end
  
  def display_goodbye_message
    puts 'Thanks for playing Tic-Tac-Toe. Goodbye!'
  end
  def play
    display_welcome_message
    display_board
    
    loop do
      human_moves
      display_board
      break if board.full?
      computer_moves
      display_board
      break if winner? || full_board?

    end
    
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play