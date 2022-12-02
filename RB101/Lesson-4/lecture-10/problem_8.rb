#P: PROBLEM STATEMENT
# How does 'take' work? Is it destructive? How can we find out?

#Explicit Requirements:
# Explain how the .take method works
# Determine if .take is a destructive method and explain how we can find this out

#Implicit Requirements:
# Look up .take method in ruby docs

#E: EXAMPLES/ TEST CASES
=begin
arr = [1, 2, 3, 4, 5]
arr.take(2)
=end

#D: DATA STRUCTURE: n/a
#A: ALGORITHM
#1. Look up .take in ruby docs to determine how it works
#2. Explain how .take works and answer if it is a destructive method or not

#C: CODE

# Since the caller is an array, it makes sense to look for .take method in the Array Class of ruby docs and that is in fact where we find it
# Here we learn that .take returns the first however many elements are specified in the caller array

# We now know that the code above will return an array consisting of [1, 2]
# The documentation doesn't explicitly state that the .take method is non-destructive but it does hint that that is the case through the example provided
# We can confirm this by outputting the arr after calling the .take method to see what the original array returns
# By doing so we determine that yes, .take is in fact a non-destructive method

arr = [1, 2, 3, 4, 5]
arr.take(2)
p arr