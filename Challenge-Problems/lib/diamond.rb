class Diamond
  LETTERS = ('A'..'Z').to_a
  def self.make_diamond(letter)
    if letter == 'A'
      return "A\n"
    elsif letter == 'B'
      return " A \nB B\n A \n"
    end
    
    diamond = ''
    diamond << ascending_diamond(letter)
    diamond << middle_row(letter)
    diamond << descending_diamond(letter)
    diamond
  end
  
  private
  def self.ascending_diamond(letter)
    diamond = ''
    counter = 0
    (LETTERS.index(letter)).times do
      outer_white_space = ' ' * (LETTERS.index(letter) - counter)
      if counter == 0
        inner_white_space = ''
      else
        inner_white_space = ' ' * (counter * 2 - 1)
      end
      if LETTERS[counter] == 'A'
        diamond << "#{outer_white_space}A#{outer_white_space}\n"
      else
        diamond << "#{outer_white_space}#{LETTERS[counter]}#{inner_white_space}#{LETTERS[counter]}#{outer_white_space}\n"
      end
      counter += 1
    end
    diamond
  end
      
  def self.middle_row(letter)
    white_space = ' ' * (LETTERS.index(letter) * 2 - 1)
    return diamond_mid_row = "#{letter}#{white_space}#{letter}\n"
  end
  
  def self.descending_diamond(letter)
    diamond = ''
    letter_index_tracker = LETTERS.index(letter)
    counter = 1
    (LETTERS.index(letter)).times do
      outer_white_space = ' ' * counter
      if letter_index_tracker <= 1
        inner_white_space = ' '
      else
        inner_white_space = ' ' * ((letter_index_tracker - 1) * 2 - 1)
      end
      if LETTERS[letter_index_tracker-1] == 'A'
        diamond << "#{outer_white_space}A#{outer_white_space}\n"
      else
        diamond << "#{outer_white_space}#{LETTERS[letter_index_tracker-1]}#{inner_white_space}#{LETTERS[letter_index_tracker-1]}#{outer_white_space}\n"
      end
      counter += 1
      letter_index_tracker -= 1
    end
    diamond
  end
end
  