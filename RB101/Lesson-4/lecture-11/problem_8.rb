
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# block above behaves as follows
=begin

1. First iteration of numbers.each begins
2. the number being operated upon in the first iteration (number associated with index value of 0) is displayed
3. .shift(1) method is called, which removes the first element AND SHIFTS ALL OTHER ELEMENTS DOWN 1 INDEX SPOT
4. so at the start the array was [1(idx0), 2(idx1), 3(idx2), 4(idx3)] and has now been mutated into [2(idx0), 3(idx1), 4(idx2)]

5. second iteration of numbers.each begins
6. the loop is now iterating on the value associated with INDEX = 1, which used to be the number 2 but now is associated with number 3
7. the value associated with the current index number is printed onto the screen which is 3
8. .shift(1) method is called which removes the first element(s) from the array
9. the numbers array has now been mutated from [2(idx0), 3(idx1), 4(idx2)] into now [3(idx0, 4(idx1))]
10. the .each method has now looped twice and wants to move onto a third iteration which would use the value associated with the index value = 2 EXCEPT there is no longer any value associated with index = 2
11. the loop now terminates, behaving as if all index values in the caller array have been iterated through
=end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# block above behaves as follows
=begin

we know from ruby docs that .pop method revmoes that last n elements of the array and returns an array of all removed values

1. the loop begins the first iteration through the numbers array
2. the value corresponding to the index = 0 is displayed on the screen [1]
3. the last 1 element(s) of the array are removed and returned as a single value array. the numbers array has now been mutated from [1(idx0), 2(idx1), 3(idx2), 4(idx3)] into [1(idx0), 2(idx1), 3(idx2)]

4. the loop begins the second iteration through the numbers array, now referencing the value associated with the index = 1
5. the value corresponding to the index = 1 is displayed on the screen [2]
6. the last 1 element(s) of the array are removed and returned as a single value array. the numbers array has once again been mutated, now from [1(idx0), 2(idx1), 3(idx2)] into [1(idx0), 2(idx1)]

7. the loop now evaluates if there is an index value = 2 to iterate through, except the caller array has now been mutated into a 2 object collection and thus does not have any more values to continue iterating through
8. thus, the loop ends after 2 iterations
=end
