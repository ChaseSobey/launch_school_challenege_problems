
class Series
  attr_reader :number_string
  def initialize(num)
    @number_string = num
  end
  
  def slices(slice_size)
    raise ArgumentError.new if slice_size > number_string.size
    
    result = []
    character_array = number_string.chars.map(&:to_i)
    counter = 0
    
    loop do
      break if counter + slice_size > character_array.size
      result << character_array[counter...(counter + slice_size)]
      counter += 1
    end
    result
  end
end 
