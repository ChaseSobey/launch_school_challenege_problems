#P: PROBLEM STATEMENT
# Find the index of the first name that starts with 'Be' in the array below

#Explicit Requirements
# return the index value of the first string in the array that STARTS WITH 'Be'

#E: EXAMPLES / TEST CASES

#flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#D: DATA STRUCTURE: We will be working with an array since that is the collection object the problem has assigned

#A: ALGORITHM

#1. iterate through the array using the .each_with_index method 
#2. if the current value starts with 'Be' then puts the index of that string object
#3. expect integer 3 to be displayed
#C: CODE

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

result = flintstones.each_with_index do |name, index|
  if name[0, 2] == 'Be'
    index
  end 
end

p result

=begin
ALTERNATE SOLUTION
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

result = flintstones.index { |name| name[0, 2] == 'Be' }

p result
=end