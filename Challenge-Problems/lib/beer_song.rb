
class BeerSong
  def self.verse(num)
    determine_verse(num)
  end
  
  def self.verses(start_verse, end_verse)
    desired_verses = ''
    start_verse.downto(end_verse) do |num|
      desired_verses += determine_verse(num)
      desired_verses += "\n" if num != end_verse
    end
    desired_verses
  end
  
  def self.lyrics
    self.verses(99, 0)
  end
  
  private
  
  def self.determine_verse(num)
    if num > 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n" 
    elsif num == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif num == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif num == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      raise ArgumentError.new('Cannot have a negative number')
    end
  end
end
