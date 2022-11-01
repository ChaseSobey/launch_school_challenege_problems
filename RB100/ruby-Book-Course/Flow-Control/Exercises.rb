#2
=begin
def all_capper(sentence)
  if sentence.length < 10
    puts sentence
  else 
    puts sentence.upcase!
  end 
end 

puts all_capper("Less ten")
puts all_capper("greater than ten words!")
=end

#3
puts "Please input number between 0 and 100"
number = gets.chomp.to_i

if number < 0
  puts "Read the prompt better asshole"
elsif number >= 0 && number <= 50
  puts "#{number} is in between 0 and 50"
elsif number >= 51 && number <=100
  puts "#{number} is in between 51 and 100"
else
  puts "Why did you pick higher than 100 dude?"
end 
