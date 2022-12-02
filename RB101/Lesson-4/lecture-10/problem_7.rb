#P: PROBLEM STATEMENT
# What is the BLOCK'S return value in the following code? How is it determined? Also, what is the return value of 'any?' in this code and what does it output?

#Explicit Requirements
# -Determine what value the BLOCK returns
# -Explain how that was block returned value was determined
# -Determine what the method .any? returns
# -Explain .any? outputs

#E: EXAMPLES/ TEST CASES
=begin
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
=end 

#D: DATA STRUCTURE: n/a
#A: ALGORITHM
#1. Examine the block and determine the output each iteration
#2. Explain how this is the returned value with your knowledge of blocks
#3. Use ruby docs to look up the .any? method to get a better understanding of what it does
#4. determine what .any? returns
#5. explain what .any? outputs

#C: CODE

# The .any? method iterates through the numbers array and passes each value into the block
# The block then PUTS the value of the current iteration and then checks if the current number is odd
# Depending on whether the value is odd or even, the block RETURNS A BOOLEAN OF TRUE OR FALSE

# Within ruby docs under the Enumerables Class we find the .any? method
# Here we learn that the method RETURNS A BOOLEAN of true if any of the elements in the collection meet the block criteria or false if all collection elements return false or nil
# Because both 1 and 3 are odd numbers, .any? WILL RETURN TRUE
# .any? stops iterating after the first instance of TRUE, meaning only the first value of 1 is every passed into the block

result = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end
p result