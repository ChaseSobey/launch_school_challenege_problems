#P: PROBLEM STATEMENT
# What is the return value of the select method below? Why?
# Explicit Requirements: determine the returned value of select method

#E: EXAMPLES/ TEST CASES
=begin
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
=end

#D: DATA STRUCTURE: n/a
#A: ALGORITHM: n/a

#C: CODE


#the method iterates thru the array calling the select method ([1, 2, 3])
# the method specifies num > 5
# the final line is simply the string 'hi'
# since methods return the final line unless the reserved word 'return' is used elsewhere, therefore 'hi' will be returned and is considered to be a truthy value since it is not 'false' or nil, thus making each value in the array meet the truthy condition and be included in the returned array
# thus, the output will be [1, 2, 3]

result = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p result