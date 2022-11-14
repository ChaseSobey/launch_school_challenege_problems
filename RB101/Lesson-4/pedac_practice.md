#The PEDAC PROCESS

## Problem: Sum Even Number Rows ##

#Problem Statement
# Imagine a sequence of consecutive even integers beginning with 2. The integers are goruped in rows, with the first row containing one integer
# the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an
# integer representing the sum of all the integers in that row.

## P: Understanding the Problem
### GENERAL GUIDELINES ###
# - Establish the rules/ define the boundaries of the problem
#    - Assess available information
#    - Restate Explicit requirements
#    - Identify Implicit requirements
#    - Explicit Requirements
#    - Implicit Requirements
# Spend enough time, dont rush this step


##FOR EXAMPLE PROBLEM ##
# Restating of problem: in a data set where each row of consecutive even integers is one term greater than the previous row, sum whatever row of values corresponds to the user inputted integer
# begins with the value 2, and are consecutive integers
# each row is incrementally larger than the last row
# sequence is grouped into rows
# 'row number' will be equal to the number of elements in the row i.e. row 1 has 1 element, row 2 has 2 elements, row 3 has 3 elements and so on

# EXPLICIT REQUIREMENTS
#Input: an integer, this will signify the row, which is a subset of a sequence of integers
#Output: an integer, represents the sum of the integers in a row identified by the input integer 

# Sequence looks like as follows:

# 2,
# 4, 6
# 8, 10, 12
# 14, 16, 18, 20
# 22, 24, 26, 28, 30 ...

# How do we create this structure?

# IMPLICIT REQUIREMENTS
# Input will always be an integer
# input of 0 returns 0


## E: Examples and Test Cases
### GENERAL GUIDELINES ###
# Consists of examples using the specific syntax of the problem to help identify edge cases and better understand the desired output 
# Can confirm or refute assumptions
# Help to answer questions about implicit requirements
# Act as assertions which help to codify the rules and boundaries

## EXAMPLES FOR EXAMPLE PROBLEM ##
# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68

## D: Data Structures
### GENERAL GUIDELINES ###

# Help reason with data logically
# Help interact with data at implementation level
# Thinking in terms of data structures is part of problem solving process
# Data structures closely linked to algorithm
#  - Set of steps from input to output
#    - Involves structuring data in a certain way

## FOR EXAMPLE PROBLEM ##
# The data set is a string of numbers divided into rows of integers
# Upon inspection, a 2d array where each row is a separate array within the main array makes a lot of sense for organizing this problem

# ***Data Structure***
# [
# [2],
# [4, 6],
# [8, 10, 12],
# [14, 16, 18, 20],
# [22, 24, 26, 28, 30],
# ...
# ]

# Overall structure representing a sequence as a whole
# Individual rows within overall structure
# Individual rows in a set order in context of sequence
# Individual rows contain integers
# Can assume that integers are in a set order in the context of the sequence

## A: Algorithms
### GENERAL GUIDELINES ###
# An algorithm is a logical sequence of steps for accomplishing a task or objective
# Closely related to data structure, can think of algorithm as steps required to structure the data in a way that produces the desired outcome
# Want to keep abstract and high level, so write in plain words and avoid implementation detail like specfic methods 
# Dont worry about efficiency when first getting used to this process 
 

## ALGORITHM
#1. Create an empty 'rows' array to contain all of the rows
#2. Create a 'row' array and add it to the overall 'rows' array
#3. repeat step 2 until we have the necessary number of rows to reach the input value
#4. Sum the final row
#5. Return the sum of the final row


# *Problem: Create a row*
# Row is an array
# Array contains integers
# Integers are even consecutive numbers
# Integers in each row form part of an overall larger sequence
# Rows are of different lengths

#Input: the information needed to create the output
#  -need the starting integer for the row
#  -need the length of the row
#Output: the row itself: [8, 10, 12]


#Examples:
# start: 2, length: 1 --> [2]
# start: 4, length: 2 --> [4, 6]
# start: 8, length: --> [8, 10, 12]

# Data Structure is an array of integers
# Algorithm
#1. Create an empty row array to contain the integers
#2. Add the starting integer
#3. Increment the starting integer by 2 to get the next integer in the sequence
#4. Repeat steps 2 & 3 until the array has reached the correct length
#5. Return the 'row' array




## C: Implementing a solution in code

## C: Implementing a solution in code
# -Translating solution algorithm to code
# -Think about algorithm in context of programming language
#    - Language features and constraints
#    - Characteristics of data structures
#    - Built in functions/ methods
#    - Syntax and coding patterns
# -Create test case
# -Code with intent