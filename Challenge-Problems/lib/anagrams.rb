

class Anagram
  
  def initialize(word)
    @word = word
  end
  
  def match(potential_anagrams_arr)
    potential_anagrams_arr.select do |word|
      next if word.downcase == @word.downcase
      word.downcase.chars.sort == @word.downcase.chars.sort
    end
  end
end
