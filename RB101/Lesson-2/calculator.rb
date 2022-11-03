# Started Lesson 6, UPDATE: Lesson 11
# Walk-trhough: Refactoring Calculator

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

## METHOD DEFINITIONS ##
def prompt(message)
  puts("=> #{message}")
end 

def valid_number?(num)
  (num == num.to_i.to_s) || (num == num.to_f.to_s)
end 

def operation_to_message(op)
  case op
  
  when '1'
    "Addinng"
  
  when '2'
    "Subtractinng"
  
  when '3'
    "Multiplying"
    
  when '4'
    "Dividing"
  end 
end 

## VARIABLE INITIALIZATION
name = ''
number1 = nil
number2 = nil
operator = nil

## START OF PROGRAM

prompt('Welcome to Calculator! Please enter name')

loop do 
  name = gets.chomp
  if name.empty?
    prompt("Make sure to use a valid name friend")
  else 
    break
  end 
end 

prompt("Hi #{name}!")

loop do #Main Loop
  loop do 
  prompt "What's the first number?"
  number1 = gets.chomp
  
    if valid_number?(number1)
      prompt "The number is " + number1 + "!"
      break
    else 
      prompt("Hmm... that didnt look like a valid number.")
    end 
  end 
  
  loop do 
    prompt("What's the second number?")
    number2 = gets.chomp
    if valid_number?(number2)
      prompt("The number is " + number2 + "!")
      break
    else
      prompt("Hmm... that didnt look like a valid number.")
    end 
  end
  
  operator_prompt = <<-MSG
  What operation would you like to perform?
  1) Add
  2) Subtract
  3) Multiply
  4) Divide?
  Please input the number corresponding to the operator you are interested in
  MSG
  
  prompt(operator_prompt)
  
  loop do 
    operator = gets.chomp
    
    if %w(1 2 3 4).include?(operator)
      break
    else 
      prompt("Make sure you choose a valid operator (1, 2, 3 or 4)")
    end 
  end 
  
  prompt("#{operation_to_message(operator)} the two numbers...")
  
  result = case operator
          when '1'
            result = number1.to_i + number2.to_i
    
          when '2'
           result = number1.to_i - number2.to_i
    
          when '3'
           result = number1.to_i * number2.to_i
    
          when '4'
            if number2.to_i == 0
              puts "Divide by zero error"
            else
              result = number1.to_f / number2.to_f
            end 
      
  end 
   
  prompt("The result is #{result}")
  
  prompt("Do you want to perform another calculation? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 

prompt("Thank you for calculating with us #{name}! We value your business")