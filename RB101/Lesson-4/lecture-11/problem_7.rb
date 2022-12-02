#P: PROBLEM STATEMENT
# Create a hash that expresses the frequency with which each letter occurs in the string below

# Explicit Requirements:
# determine how many occurences of each unique character appear in the input string
# create a has where each key is the unique character and each value is the number of occurences

#E: EXAMPLES / TEST CASES

# statement = "The Flintstones Rock"
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

#D: DATA STRUCTURES: Multiple arrays can be used order the data in a meaningful way before placing all data in the final hash of occurences

#A: ALGORITHM

#1. create an array of all characters called characters
#2. create an array of unique characters from the characters array called unique_characters
#3. count the number of occurences of each unique character by iterating through the characters array 
#4. create an empty hash called unique_character_occurences
#5. iterate through the unique characters array, asisgning each unique character as a key in the unique_characters_occurence hash and the number of occurences with the same index number as the assigned value (Consider using each_with_index)

#C: CODE

statement = "The Flintstones Rock"
unique_character_occurences = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequencey = statement.count(letter)
   unique_character_occurences[letter] = letter_frequencey if letter_frequencey > 0
end 

p unique_character_occurences
  

## WAS UNABLE TO FIGURE OUT AND HAD TO LOOK UP THE SOLUTION ##
  