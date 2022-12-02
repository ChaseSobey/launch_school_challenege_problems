#P: PROBLEM STATEMENT
# Write a method equivalent to the ruby on rails method of .titleize

#Explicit Requirements:
# write a method that takes a string arguement and returns the string with the first letter of each word capitalized

#E: EXAMPLES / TEST CASES

# words = "the flintstones rock" => "The Flintstones Rock"

#D: DATA STRUCTURE: will be working with a method that converts a string to an array and then back into a string

#A: ALGORITHM

#!. def a method called titleize that takes in a string as a parameter
#2. split the passed in string into an array of each word
#3. iterate through the array of individual words mutating the original array to capitalize the first letter of each word using .capitalize!
#4. join each word in the array back into a single string with each word separated by ' '
#5. return the recreated string

#C:
words = "the flintstones rock"

def titleize(sentence)
  words = sentence.split(' ')
  words.each { |word| word.capitalize! }
  words.join(' ')
end 

p titleize(words)