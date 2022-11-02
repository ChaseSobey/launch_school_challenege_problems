# Lesson 6 
# Walk-trhough: Calculator

#Methods for each operator

def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end 

def multiply(num1, num2)
  num1 * num2
end 

def divide(num1, num2)
  num1 / num2
end 

#User input for numbers to operate on
  puts "Please input first number"
  number1 = gets.chomp.to_i

  puts "Please input second number"
  number2 = gets.chomp.to_i
  

#Operator choice
solution = nil

puts "Please input operation of choice (+, -, *, /)"
operator = gets.chomp

case operator

when "+"
  solution = add(number1, number2)
  puts "#{number1} + #{number2} = #{solution}"

when "-"
  solution = subtract(number1, number2)
  puts "#{number1} - #{number2} = #{solution}"
  
when "*"
  solution = multiply(number1, number2)
  puts "#{number1} * #{number2} = #{solution}"

when "/"
  solution = divide(number1, number2)
  puts "#{number1} + #{number2} = #{solution}"
  
else
  puts "Error! can only choose +, -, *, / as an operator!"

end 