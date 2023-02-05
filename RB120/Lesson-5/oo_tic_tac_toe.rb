#require "pry"

class Board
  
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]]            # diagonals
  def initialize
    #Below is a short hand to populate a hash with the starting marker symbols without having to hard type out the key value pairs
    @squares = {}
    reset
  end
  
  def draw
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}   "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |   "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}   "
    puts "     |     |   "
    puts "-----+-----+-----"
    puts "     |     |   "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}   "
    puts "     |     |   "
  end
  
  def []=(num, marker)
     @squares[num].marker = marker
  end
  
  def unmarked_keys
    @squares.keys.select{ |key| @squares[key].unmarked? }
  end
  
  def full?
    unmarked_keys.empty?
  end
  
  def someone_won?
    #double bang returns a boolean, so if a non nil object is returned, then it returns true and that means someone won
    !!winning_marker
  end
  
  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end
  
  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end
  
    # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil #present to return nil if upon evaluation, no player has gotten 3 in a row yet
  end
  
  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
  
  def reset
    (1..9).each {|key| @squares[key] = Square.new}
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker
  def initialize(marker = INITIAL_MARKER)
    @marker = marker
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
  attr_accessor :marker, :score
  attr_reader :name
  def initialize(marker)
    @marker = marker
    @score = 0
    @name = ''
  end
  
  def set_player_name
    puts "Please enter your name"
    @name = gets.chomp
  end
  
  def set_computer_name
   @name = %w(Robo-bitch Terminator Robot-Menace Stoopidtron).sample
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end
  
  private
  
  attr_reader :board, :human, :computer
  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!!'
    puts ''
  end
  
  def clear
    system 'clear'
  end
  
  def human_moves
    square = nil
    puts "Choose an open square: #{board.unmarked_keys}: "
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts 'That was not a valid choice, try again'
    end
    
    board[square] = human.marker
  end
  
  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end
  
  def current_player_moves
    if @current_marker == HUMAN_MARKER
      human_moves
      @current_marker == COMPUTER_MARKER
    else
      computer_moves
      @current_marker == HUMAN_MARKER
    end
  end
  
  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe, Goodbye!'
  end
  
  def update_score
    if board.winning_marker == HUMAN_MARKER
      human.score += 1 
    elsif board.winning_marker == COMPUTER_MARKER
      computer.score += 1
    end
  end
  
  def display_result
    display_board
    case board.winning_marker
    when human.marker    then puts "#{human.name} wins!!"
    when computer.marker then puts "#{computer.name} wins!!"
    when nil             then puts "The board is full, It's a tie!!"
    end
    puts "The score is #{human.name}: #{human.score}. #{computer.name}: #{computer.score}"
  end
  
  def play_again?
    puts 'Would you like to play again? (y/n)'
    answer = gets.chomp.downcase
    answer.start_with?('y') ? true : false
  end
  
  def display_board_and_clear_screen
    clear
    display_board
  end
  
  def display_board
    puts "#{human.name} is: #{human.marker}. #{computer.name} is: #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end
  
  def reset
    clear
    board.reset
    @current_marker == FIRST_TO_MOVE
  end
  
  def display_play_again_message
    puts 'Lets play again!'
  end
  
  public
  
  def play
    display_welcome_message
    human.set_player_name
    computer.set_computer_name
    
    loop do
      display_board_and_clear_screen
      
      loop do
        human_moves
        
        break if board.someone_won? || board.full?
        computer_moves
        break if board.someone_won? || board.full?
        display_board
      end
      update_score
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    
    display_goodbye_message
  end
end

game = TTTGame.new
game.play