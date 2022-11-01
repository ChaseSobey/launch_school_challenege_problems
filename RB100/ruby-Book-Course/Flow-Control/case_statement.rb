#case_statement.rb
#=begin
a = 5

case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a is neither 5 nor 6"
end 

# Case Statement above is equivalent if statement below

b = 5

if b == 5
  puts "b is 5"
elsif b == 6
  puts "b is 6"
else
  puts "b is neither 5 nor 6"
end 

# Case Statement with no argument below is equivalent to both statements above 

c = 5

case 
when c == 5
  puts "c is 5"
when c == 6
  puts "c is 6"
else
  puts "c is neither 5 nor 6"
end 
#=end

