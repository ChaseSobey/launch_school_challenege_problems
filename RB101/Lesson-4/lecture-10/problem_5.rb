#P: PROBLEM STATEMENT
# What does 'shift' do in the following code? How can we find out?

# Explicit Requirements: determine the returned value after using the shift method and explain why that returned value is what it is
# Implicit Requirements: use ruby docs to look up what the shift method does to a hash

#E: EXAMPLES/ TEST CASES
=begin
hash = { a: 'ant', b: 'bear' }
hash.shift
=end

#D: DATA STRUCTURE: n/a/
#A: ALGORITHM
#1. Look up .shift in ruby docs
#2. determine the returned value

#C: CODE

# Upon looking up the shift method in the Hash Class in ruby docs, we learn that shift removes a key value pair from a hash and returns the two item array of the key and value pair
# the shift method is destructive and the caller no longer contains the removed key value pair WHILE THE RETURNED VALUE OF THE METHOD IS THE REMOVED KEY VALUE PAIR IN AN ARRAY

# With this in mind looking at the code above we see that no key value pair has been specified so the first pair will be returned
# The resulting returned value will be [:a, 'ant']

hash = { a: 'ant', b: 'bear' }
p hash.shift