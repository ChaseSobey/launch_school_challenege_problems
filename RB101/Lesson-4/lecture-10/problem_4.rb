#P: PROBLEM STATEMENT
# What is the return value of 'each_with_object' in the following code? Why?

# Explicit Requirements: determine the returned value from the block of code below and describe why the return value is what it is?
# Implicit Requirement: Look up the each_with_object method in ruby docs to determine exactly what it does

#E: EXAMPLES/ TEST CASES

=begin
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
=end

#D: DATA STRUCTURE: an array is calling the method and a hash will be returned
#A: ALGORITHM
#1. Look up each_with_object in ruby docs
#2. determine the returned value and why it is what it is

#C: CODE

# each_with_object can be found in ruby docs in the Enumerables Class
# here we learn that the collection object is what is passed in the method parameter which in this case is a hash
# the block argument is the first parameter 'value' while the second argument is a reference to the collection object, which in this case is the hash
# the block then iterates through each term in the caller array and assigns as the first character of the string object as a key and the entire string as the associated object

# the returned value will be a hash as follows { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }

result = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

p result