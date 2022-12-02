#-------------------- METHOD DEFINITIONS --------------------# 
def initialize_hand(player = [])
  player = []
end

def deal_first_hand(player, cards)
  2.times do 
    player << cards.keys.sample
  end
  player
end

def deal_new_card(player, cards)
  player << cards.keys.sample
end

def hand_evaluation(player, cards_hash)
  hand_value = 0
  player.each do |card|
    # Initial Summation of values
    if card == 'ace'
      hand_value += cards_hash[card].last
    else hand_value += cards_hash[card]
    end
  end
    # Final determination for each ace value
  player.select{ |card| card == 'ace' }.count.times do
    if hand_value > 21
      hand_value -= cards_hash['ace'].last
      hand_value += cards_hash['ace'].first
    end
  end
  hand_value
end
  
def display_player_hand(player, divider = ', ', final_divide = 'and ')
  deck_listed_out = ''
  #Iterating each card in hand except for last one
  counter = 0
  (player.size - 1).times do
    deck_listed_out += (player[counter] + divider)
    counter += 1
  end
  # Adding final card in hand to deck_listed_out
  deck_listed_out += (final_divide + player.last) 
  
  puts "You have: #{deck_listed_out}"
end

def display_dealer_hand(dealer)
  puts "Dealer has #{dealer.first} and unknown card"
end

def busted?(player, cards_hash)
  hand_evaluation(player, cards_hash) > 21
end

def detect_result(player_cards, dealer_cards, cards_hash)
  player_total = hand_evaluation(player_cards, cards_hash)
  dealer_total = hand_evaluation(dealer_cards, cards_hash)
  
  if player_total > 21 && dealer_total > 21
    :both_busted
  elsif player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif  player_total < dealer_total
    :dealer
  else  :tie
  end
end

def display_result(player_cards, dealer_cards, cards_hash)
  result = detect_result(player_cards, dealer_cards, cards_hash)
  
  case result
  when :both_busted
    puts 'You both went over 21, nodoby wins!'
  when :player_busted
    puts 'You went over 21, you lose!'
  when :dealer_busted
    puts 'Dealer went over 21, you win!'
  when :player
    puts 'you win!!'
  when :dealer
    puts 'Dealer won!!'
  when :tie
    puts 'Its a tie!!'
  end

end

#-------------------- START OF CODE --------------------#

cards = {'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8,
         'nine' => 9, 'ten' => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => [1, 11] }
loop do 
  player_hand = initialize_hand()
  dealer_hand = initialize_hand()
  another_round = ''

  deal_first_hand(player_hand, cards)
  deal_first_hand(dealer_hand, cards)

#Start of player gameplay loop
  loop do 
    display_player_hand(player_hand)
    display_dealer_hand(dealer_hand)
    hand_evaluation(dealer_hand, cards)
    hit_or_stay = ''

    loop do
      puts 'Hit or Stay?'
      hit_or_stay = gets.chomp.downcase

      break if hit_or_stay.start_with?('h', 's')
      puts " You must either choose hit or stay"
    end

  if hit_or_stay.start_with?('h')
    deal_new_card(player_hand, cards)
  end
  
  break if hit_or_stay.start_with?('s') || busted?(player_hand, cards)
  
  end 
#End of player gameplay loop

#Start of dealer gameplay loop
if !busted?(player_hand, cards) #Dealers turn is skipped if player has already busted
  loop do
    deal_new_card(dealer_hand, cards) if hand_evaluation(dealer_hand, cards) <= 17
    break if hand_evaluation(dealer_hand, cards) > 17 || busted?(dealer_hand, cards)
  end
end
#End of dealer Gameplay loop

#Evaluation of each players hand and determination of winner
  puts "Player has: #{hand_evaluation(player_hand, cards)}"
  puts "Dealer has #{hand_evaluation(dealer_hand, cards)}"

  display_result(player_hand, dealer_hand, cards)

  puts 'Play again? (y or n)'
  another_round = gets.chomp.downcase

  break unless another_round.start_with?('y')
  puts ' ---------------------- '
end

puts 'Thanks for playing!'
