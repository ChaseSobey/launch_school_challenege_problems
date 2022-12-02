#P: PROBLEM STATEMENT
# What is the return value of the following statement? Why?

#Explicit Requirement: Determine the return value of the block of code below and explain why it is what it is
#Implicit Requirement: Look up in ruby docs the methods .pop and .size to determine what they do to the caller

#E: EXAMPLE/ TEST CASE

#['ant', 'bear', 'caterpillar'].pop.size

#D: DATA STRUCTURE: n/a
#A: ALGORITHM
#1. Look up what .pop and .size methods do in ruby docs

#C: CODE

# Since the caller is an array, logical starting point to find the .pop and .size methods in ruby docs is to look in the Array Class, which is where we find both methods
# Here we learn that .pop removes the last element from an array and RETURNS THAT REMOVED VALUE, meaning this is a destructive method. We also learn if called on an empty array it returns nil
# We now currently have a string returned and that string is calling the .size method, meaning we now look in the String Class for what the .size method does
# Within the String Class, we learn that size returns the length of the string as an integer value

# This means our final returned value of the method chain will be the integer value representing the length of the final string in the array ('caterpillar'), which will be 11

p ['ant', 'bear', 'caterpillar'].pop.size