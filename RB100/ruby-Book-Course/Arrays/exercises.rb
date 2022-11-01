array = Array(1..7)

new_arr = []

array.each do |n|
  new_arr << n + 2
end 

p array
p new_arr