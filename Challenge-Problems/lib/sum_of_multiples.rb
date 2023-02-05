
class SumOfMultiples
  attr_reader :multiples
  def initialize(*multiples)
    @multiples = multiples.size > 0 ? [*multiples] : [3, 5]
  end
  
  def to(chosen_number)
    confirmed_multiples = []
    
    multiples.each do |multiple|
      0.upto(chosen_number - 1) do |number|
        confirmed_multiples << number if number % multiple == 0
      end
    end
    confirmed_multiples.uniq.sum
  end
  
  def self.to(chosen_number)
    SumOfMultiples.new.to(chosen_number)
  end
end

