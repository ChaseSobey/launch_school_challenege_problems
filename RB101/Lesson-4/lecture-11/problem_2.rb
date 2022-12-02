#P: PROBLEM STATEMENT
# Add up all the ages from the Munster Family hash below

#Explicit requirements:
# Given a hash, return an integer representing the sum of all ages (values) in the Munster Family hash

#E: EXAMPLES / TEST CASES

#ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

#D: DATA STRUCTURE: A hash converted to an integer will be used for the main solution. for the alternate solution an array will be used since either collection object can solve this problem

#A: ALGORITHM

#1. Initialize varible called sum = 0
#2. call each_value on the ages hash to iterate over each value
#3. within the block add each value to the sum variable

## ALTERNATE SOLUTION ##
#1. Initialize an empty array called age_array
#2. set age array equal to ages.value to obtain an array of only ages
#3. use .sum to sum every age in the age array


#C: CODE
=begin
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = 0

ages.each_value { |age| sum += age }

puts sum
=end

## ALTERNATE SOLUTION ##


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age_array = []
age_array = ages.values

p age_array
p age_array.sum

