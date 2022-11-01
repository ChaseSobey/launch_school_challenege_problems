 #1
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
=begin
arr.each do |num| 
  puts "Value = #{num}"
end 
=end

#2
=begin
arr.each do |num|
  if num > 5
    puts num
  end 
end 
=end 

#3
=begin
new_arr = arr.select { |num| num % 2 != 0 }

p new_arr
=end

#4

arr.push(11)
arr.unshift(0)
p arr


#5
arr.pop
p arr
arr.push(3)
p arr