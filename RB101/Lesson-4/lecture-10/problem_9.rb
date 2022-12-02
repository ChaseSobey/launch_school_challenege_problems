#P: PROBLEM STATEMENT
# What is the return value of 'map' in the following code? Why?

#Explicit Requirements:
# -determine what is returned by the .map invocation below
# -explain why the returned value is what it is

#E: EXAMPLE/ TEST CASES

=begin
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
=end

#D: DATA STRUCTURE: n/a
#A: ALGORITHM: n/a

#C: CODE

# .map is used to iterate over the caller hash while transforming the hash into an array SINCE MAP ALWAYS RETURNS AN ARRAY
# the block then checks if the value in the key value pair for that iteration is greater than 3, and if so then the key value pair is transformed into the value 
# the code results in an array consisting of [nil, 'bear']


result = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

p result