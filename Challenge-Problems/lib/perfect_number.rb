
class PerfectNumber
  
  def self.classify(num)
    raise StandardError('Negative Number') if num < 0
    
    divisors = []
    1.upto(num - 1) do |number|
      divisors << number if num % number == 0
    end
    
    sum = divisors.sum
    case
    when sum < num
      'deficient'
    when sum > num
      'abundant'
    when sum == num
      'perfect'
    end
  end
end