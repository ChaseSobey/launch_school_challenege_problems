=begin
## CHASE
PROBLEM STATEMENT
Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

Explicit Requirements:
-need to determine the shortest contiguous subarray that the sum of values will be greater than or equal to the individual positive Integer
-the parameters passed into the method 'minSubLength' will always be 2 objects, the first being an array of integers, and the second being a single positive Integer
- all values are positive integers

Implicit Requirements:
- if no contiguous subarray of integers is greater than or equal to the single positive integer, then return 0

EXAMPLES / TEST CASES

# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2 <-- this example is showing that the subarray consisting of index values 4 and 5 returns the desired result

# p minSubLength([1, 10, 5, 2, 7], 9) == 1 <-- this example shows that a single value can be a sub array and the first, shortest possible sub array is used
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4 <-- example shows the same as the above test case

# p minSubLength([1, 2, 4], 8) == 0 <-- this example shows that if the entire sub array is not greater than or equal to the target individual integer, then the method should return a value of 0

DATA STRUCTURE

the main data structure being evaluated is the array of integers passed into the method minSubLength and strings of integers make sense to be contained in arrays as well

ALGORITHM

HIGH LEVEL
1. Determine all possible sub-arrays from the given main integer array (CAN SEPARATE THIS INTO A SEPARATE METHOD)
  -Initialize an empty array called all_sub_arrays
  -initialize a variable called starting_index = 0
  -BEGIN OUTER LOOP
  
    -Break the loop if starting index == array.size
    -Initialize a variable called times_counter
    -BEGIN INNER LOOP
    
      -break the inner loop if times_counter == array.size
      -initialize empty array called sub_array
      -initialize inner counter = 0
      
      -BEGIN TIMES LOOP (repeating [times_counter + 1 - starting_index] times)
        -append array[inner_counter + starting_index) into sub_array
        -increment inner_counter by 1
        END TIMES LOOP
        
      increment times_counter by 1
      append sub_array into all_sub_arrays
      -END INNER LOOP
      
    -increment starting_index by one
    -END OUTER LOOP
  
  return all_sub_arrays
  END DEFINITION
      

2. iterate through all of the array permutations while comparing the sum of all values in the sub array to the given single integer in question and select the sub-arrays that meet this criteria
3. return the length of the shortest sub-array whose sum of values is greater than or equal to the single integer in question
4. if no sub-array meets the requirement, then return 0


=end

def all_sub_array_grabber(array)
  all_sub_arrays = []
  starting_index = 0
  loop do
    break if starting_index == array.size
    times_counter = 0
    
    loop do 
    break if times_counter == array.size
    
    inner_counter = 0
    sub_array = []
    
    (times_counter + 1 - starting_index).times do 
      sub_array << array[inner_counter + starting_index]
      inner_counter += 1
    end
    
    times_counter +=1
    all_sub_arrays << sub_array
  end
  
  starting_index += 1
end 

  all_sub_arrays
end 


def minSubLength(array, int)
  all_sub_arrays = all_sub_array_grabber(array)
  min_sub_length = 0
  
  chosen_sub_arrays = all_sub_arrays.select do |sub_array|
    sub_array.sum >= int
  end
  
  if chosen_sub_arrays == []
    return min_sub_length
  else
    min_sub_length = chosen_sub_arrays.min{|a, b| a.length <=> b.length}.length
  end
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p  minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0