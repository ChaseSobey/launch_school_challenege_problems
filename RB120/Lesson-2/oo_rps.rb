# Classes used during gameplay
class Move
  attr_reader :value
  VALUES = %w(rock paper scissors lizard spock)
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
  end
  
  def lizard?
    @value == 'lizard'
  end
  
  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
    (paper? && (other_move.rock? || other_move.spock?)) ||
    (scissors? && (other_move.paper? || other_move.lizard?)) ||
    (spock? && (other_move.rock? || other_move.scissors?)) ||
    (lizard? && (other_move.spock? || other_move.paper?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
    (paper? && (other_move.scissors? || other_move.lizard?)) ||
    (scissors? && (other_move.rock? || other_move.spock?)) ||
    (spock? && (other_move.lizard? || other_move.paper?)) ||
    (lizard? && (other_move.rock? || other_move.scissors?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history
  def initialize
    set_name
    @score = 0
    @move_history = []
  end
end

class Human < Player
  def set_name
    puts 'Please enter name'
    @name = gets.chomp
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, scissors, lizard, or spock'
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts 'Error, you must choose rock, paper, scissors, lizard, or spock'
    end
    self.move = Move.new(choice)
    self.move_history << self.move.value
  end
end

class Computer < Player
  def set_name
    @name = ['Terminator', 'Skynet', 'Hal', 'Robot Menace'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    self.move_history << self.move.value
  end
end

# Gameplay Orchestration Engine

class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Good bye!'
  end

  def determine_winner
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    if human.move > computer.move
      puts "#{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts 'Its a tie!'
    end
    
    puts "The current score is #{human.name}: #{human.score}. #{computer.name}: #{computer.score}"
  end

  def play_again?
    puts 'Play again? (y/n)'
    answer = gets.chomp.downcase
    if answer.start_with?('y')
      true
    else
      false
    end
  end
  
  def display_move_history
    puts "#{human.name}'s move history: #{human.move_history}"
    puts "#{computer.name}'s move history: #{computer.move_history}"
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose

      determine_winner
      break unless play_again?
    end

    display_move_history
    display_goodbye_message
  end
end
RPSGame.new.play
