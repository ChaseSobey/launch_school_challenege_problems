#P: PROBLEM STATEMENT
# How does 'count' treat the block's return value? How can we find out?

#E: EXAMPLE/ TEST CASES

=begin
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
=end

#D: DATA STRUCTURE: n/a
#A: ALGORITHM: n/a

#C: CODE

# We can look up the 'count' method in ruby docs under array, there we learn that 'count' looks at the truthiness of the blocks return value when considering counting the value
# the block of code above will return the integer 2

result = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p result