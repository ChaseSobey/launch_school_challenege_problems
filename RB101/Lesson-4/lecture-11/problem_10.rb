#P: PROBLEM STATEMENT
# Given the munsters hash, modify the hash such taht each member of the Munster family has an additional "age_group" key that has one of three values desciribing the age group the family member is in ('kid', 'adult', 'senior')

#Explicit Requirements:
# add a new key to the munsters hash called 'age_group' that evaluates the age of the family member and assigns a value of either ('kid, 'adult', or 'senior')

#E: EXAMPLES / TEST CASES
=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
TURNS INTO
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
=end

#D: DATA STRUCTURE: We will be working with the given array

#A: ALGORITHM
#1. iterate through each value (which in this case is a hash consisting of keys and values)
#2. within the iteration block create a case statement for value['age']
#3. when value['age'] meets the requirement for either kid, adult or senior, make value['age_group'] = kid, adult, or senior

#C: CODE

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value do |value|
  case value['age']
  when 0...18
    value['age_group'] = 'kid'
  when 18...65
    value['age_group'] = 'adult'
  else
    value['age_group'] = 'senior'
  end
end

p munsters