#P: PROBLEM STATEMENT
# In the ages hash listed below, remove people with age 100 and greater
# Explicit Requirements:
# Augment the ages hash so that the only ages included in the hash are less than 100, which means removing only Grandpa from the hash

#E: EXAMPLES / TEST CASES

#ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 } => ages = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }

#D: DATA STRUCTURE: We will be working with a hash and will use selection to remove any key value pairs where the value is greater than 100

#A: ALGORITHM
#1. use .keep_if to hold onto any key value pairs where the value is less than 100

# OR

#1. use .delete_if to delete any key value pair where the value is greater than or equal to 100 

#C: CODE
=begin
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if { |key, value| value =< 100 }

p ages
=end 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if do |key, value|
  value >= 100
end 

p ages