#P: PROBLEM STATEMENT
# Given the array below, turn the array into a hash where the names are the keys and the values are the positions in the array

#Explicit Requirements
# have the keys of the hash be names
# have the values of the hash be the index positions of the starting array

#E: EXAMPLES / TEST CASES

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

#D: DATA STRUCTURE: input is an array and the output is a hash

#A: ALGORITHM
#1. create a new empty hash
#2. use each_with_index to set hash[name] = index

##ALTERNATE SOLUTION WITH LOOPS ##

#1. Create an empty hash called result
#2. Create variable called counter = 0
#3. begin loop that iterates through flintstones with first line being BREAK IF COUNTER == FLINTSTONES.SIZE
#4. for each iteration of flintstones result[flintstones[counter]] = counter
#5. add one to the counter

#C: CODE
=begin
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
result = {}
flintstones.each_with_index do |name, index|
  result[name] = index
end 
=end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
result = {}
counter = 0

loop do
  break if counter == flintstones.size
  
  result[flintstones[counter]] = counter
  counter += 1
end 

p result