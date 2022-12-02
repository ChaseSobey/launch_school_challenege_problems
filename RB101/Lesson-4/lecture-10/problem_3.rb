#P: PROBLEM STATEMENT
# What is the return value of 'reject' in the following code? Why?
#Determine what the method 'reject' does and then determine the return value of the code below

#E: EXAMPLES/ TEST CASES
=begin
[1, 2, 3].reject do |num|
  puts num
end
=end

#D: DATA STRUCTURE: n/a
#A: ALGORITHM: n/a

#C: CODE

# Using ruby docs under the Array Class we find that the 'reject' method returns A NEW ARRAY for the items in the caller array for which the given block is not true
# in other words, the method enumerates through the array calling the method and removes any values that meet the criteria specified in the block

# now looking at the method call and the block the code iterates through the array and each iteration PUTS the current value while RETURNING NIL
# since nil is one of two values not considered truthy, this means each iteration will not meet the truthy requirement for removal, thus causing the returned value to be the unchanged array of [1, 2, 3]

result = [1, 2, 3].reject do |num|
  puts num
end

p result