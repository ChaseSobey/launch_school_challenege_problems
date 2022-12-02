#P: PROBLEM STATEMENT
# Pick out the minimum age from our current monster family hash (shown below)

# Explicit Requirements
# Iterate through the ages hash values and return the minimum age of the hash

#E: EXAMPLES / TEST CASES

#ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

#D: DATA STRUCTURE: given a hash to work with, a possible solution involves use of an array to then determine an integer

#A: ALGORITHM

#1. initalize an empty array called age_array
#2. extact all ages from the ages hash into the age_array using .values method
#3. use .min method to return the smallest value in the age_array

#C: CODE

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#age_array = ages.values

#p age_array.min

## OR ##

p ages.values.min