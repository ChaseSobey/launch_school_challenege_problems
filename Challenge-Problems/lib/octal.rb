class Octal
  attr_reader :octal_number
  def initialize(string)
    @octal_number = string
  end
  
  def valid_number?
    return false if octal_number.match(/[89]/)
    octal_number.chars.all?{ |char| char == char.to_i.to_s }
    
  end
  
  def to_decimal
    return 0 unless valid_number?
    sum = 0
    power = 0
    
    octal_number.chars.reverse.each do |number|
      sum += (number.to_i * 8 ** power)
      power += 1
    end
    sum
  end
end


