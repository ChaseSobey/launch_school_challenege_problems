
class Triangle
  attr_reader :sides
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    
    valid_triangle?
  end
  
  def valid_triangle?
    if sides.any?{ |side| side <= 0 }
      raise ArgumentError.new('Invalid triangle, 1 or more sides length 0 or less')
    elsif sides.sum - sides.max <= sides.max
      raise ArgumentError.new('Invalid triangle, sum of short sides is less than hypotenuse')
    else
      nil
    end
  end
  
  def kind
    if sides.count(sides[0]) == 3 || sides.count(sides[1]) == 3 || sides.count(sides[2]) == 3
      'equilateral'
    elsif sides.count(sides[0]) == 2 || sides.count(sides[1]) == 2 || sides.count(sides[2]) == 2
      'isosceles'
    else
      'scalene'
    end
  end
end