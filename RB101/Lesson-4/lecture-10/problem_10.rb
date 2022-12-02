#P: PROBLEM STATEMENT
# What is the return value of the following code? Why?

#Explicit Requirements:
# What is the value returned by the block of code below?
# Why is that value returned?

#E: EXAMPLES/ TEST CASES

=begin
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
=end

#D: DATA STRUCTURE: Since .map is being used, we know that an array will be returned
#A: ALGORITHM: n/a

#C: CODE

# .map is called on the array consisting of [1, 2, 3] to iterate and potentially transform each element in the collection
# the block first checks if the value of the current iteration is greater than 1, and if so PUTS the value of the current iteration WHILE RETURNING NIL
# if the value of the current iteration is less than 1, then the value of the current iteration is returned unchanged

# This results in the value returned from the .map method being an array consisting of [1, nil, nil]

result = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p result