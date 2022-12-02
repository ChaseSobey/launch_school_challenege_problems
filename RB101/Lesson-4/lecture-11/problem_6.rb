#P: PROBLEM STATEMENT
# Write code that changes the array below so that all of the names are shortened to just the first three characters. DO NOT CREATE A NEW ARRAY

#Explicit Requirements:
# Mutate the current array
# Shorten each string in the collection array to just the first three letters

#E: EXAMPLES / TEST CASES

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)  => ['Fre', 'Bar', 'Wil', 'Bet', 'Bam', 'Peb']

#D: DATA STRUCTURE: Will be working entirely with the given ARRAY

#A: ALGORITHM
#1. Because we are explicitly requirement to mutate the original array, we know a transformation is required so .MAP method will be used
#2. use .map to iterate through the array and transform each element into name[0,3] to display the first three characters of each string object

#C: CODE

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name|  name[0, 3] }

p flintstones