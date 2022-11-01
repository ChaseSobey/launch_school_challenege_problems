answer = "Y"
until answer != "Y"
  puts "Do you want to do that again?"
  answer = gets.chomp.upcase!
end 

