
class RomanNumeral
  attr_reader :number
  ROMAN_NUMERALS = {'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400, 'C' => 100, 'XC' => 90, 'L' => 50,
                    'XL' => 40, 'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1}
  def initialize(num)
    @number = num
  end
  
  def to_roman
    local_number_variable = self.number
    result = ''
    
    ROMAN_NUMERALS.each do |roman_num, standard_num|
      repititions = local_number_variable / standard_num
      result << roman_num * repititions
      local_number_variable -= repititions * standard_num
    end
    result
  end
end