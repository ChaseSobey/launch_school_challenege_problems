require "pry"


class Card
  attr_reader :face
  FACES = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  SUITS = ["Clubs", "Spades", "Hearts", "Diamonds"]
  def initialize(suit, face)
    @suit = suit
    @face = face
  end
  
  def to_s
    "#{@suit} of #{@face}"
  end
  
  def ace?
    @face == 'Ace'
  end
  
  def jack?
    @face == 'Jack'
  end
  
  def queen?
    @face == 'Queen'
  end
  
  def king?
    @face == 'King'
  end
end

class Deck
  attr_accessor :cards
  def initialize
    #need a data structure to contain cards, could use an array containing a hash for each suite of cards as key and points as value
    @cards = []
      Card::SUITS.each do |suit|
        Card::FACES.each do |face|
         @cards << Card.new(suit, face)
      end
    end
    
    scramble!
  end  
  
  def scramble!
    cards.shuffle!
  end
  
  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    puts "--- #{name}'s Hand ---"
    cards.each do |card|
      puts "#{card}"
    end
    puts "Total: #{total}"
    puts ''
  end
  
  def total
    total = 0
    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else
        total += card.face.to_i
      end
    end
  # correct for Aces
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end
    
    total
  end
  
  def add_card(new_card)
    cards << new_card
  end
  
  def busted?
    total > 21
  end
end

class Participant 
  include Hand
  attr_accessor :name, :cards
  def initialize

    @cards = []
    set_name
  end
end


class Player < Participant
  def set_name
    name = ''
    loop do
      puts 'Please enter your name'
      name = gets.chomp
      break unless name.empty?
      puts 'Sorry, you must input a name'
    end
    self.name = name
  end
    
  def show_flop
    show_hand
  end
end


class Dealer < Participant
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']
  
  def set_name
    self.name = ROBOTS.sample
  end
  
  def show_flop
    puts "--- #{name}'s Hand ---"
    puts "#{cards.first}"
    puts " ?? "
    puts ''
  end
end

class TwentyOne
  attr_accessor :player, :dealer, :deck
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end
  
  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end
  
  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end
  
  def show_flop
    player.show_flop
    dealer.show_flop
  end
  
  def player_turn
    puts "#{player.name}'s turn..."
    
    loop do
      puts "(H)it or (S)tay?"
      answer = nil
      
      loop do
        answer = gets.chomp.downcase
        break if ['h', 's'].include?(answer)
        puts "You must either choose 'h', or 's'"
      end
    
      if answer == 's'
        puts "#{player.name} stays!"
        break
      elsif player.busted?
        break
      else
        #show update only for hit
        player.add_card(deck.deal_one)
        puts "#{player.name} hits!"
        player.show_hand
        break if player.busted?
      end
    end
  end
  
  def dealer_turn
    puts "#{dealer.name}'s turn..."
    
    loop do
      if dealer.total >= 17 && !dealer.busted?
        puts "#{dealer.name} stays!"
        break
      elsif dealer.busted?
        break
      else
        puts "#{dealer.name} hits!"
        dealer.add_card(deck.deal_one)
      end
    end
  end
  
  def show_busted
    if player.busted?
      puts "It looks like #{player.name} busted. #{dealer.name} wins!!"
    elsif dealer.busted?
      puts "It looks like #{dealer.name} busted. #{player.name} wins!!"
    end
  end
  
  def show_cards
    player.show_hand
    dealer.show_hand
  end
  
  def show_results
    if player.total > dealer.total
      puts "#{player.name} total: #{player.total}. #{dealer.name} total: #{dealer.total}"
      puts "#{player.name} wins!!"
    elsif player.total < dealer.total
      puts "#{player.name} total: #{player.total}. #{dealer.name} total: #{dealer.total}"
      puts "#{dealer.name} wins!!"
    else
      puts "It's a tie!!"
    end
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "You gotta choose either y or n"
    end
    
    answer == 'y'
  end
  
  def start
   loop do
     deal_cards
     show_flop
     
     player_turn
     if player.busted?
       show_busted
       if play_again?
         reset
         next
       else
         break
       end
     end
     
     dealer_turn
     if dealer.busted?
       show_busted
       if play_again?
         reset
         next
       else
         break
       end
     end
     #both stayed
     show_cards
     show_results
     play_again? ? reset : break
   end
   
   puts "Thanks for playing Twenty-One. Goodbye!"
  end
end


game = TwentyOne.new
game.start