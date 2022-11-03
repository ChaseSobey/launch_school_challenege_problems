# Started Lesson 6, UPDATE: Lesson 11
# Walk-trhough: Refactoring Calculator

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

## MESSAGE INITIALIZATION
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

## METHOD DEFINITIONS ##
def prompt(message)
  puts("=> #{message}")
end 

def valid_number?(num)
  (num == num.to_i.to_s) || (num == num.to_f.to_s)
end 

def operation_to_message(op)
 word = case op
  
  when '1'
    "Adding"
  
  when '2'
    "Subtracting"
  
  when '3'
    "Multiplying"
    
  when '4'
    "Dividing"
  end 
  
  word
end 

## VARIABLE INITIALIZATION
name = ''
number1 = nil
number2 = nil
operator = nil

## START OF PROGRAM

prompt(MESSAGES['welcome'])

loop do 
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['invalid_name'])
  else 
    break
  end 
end 

prompt(MESSAGES['hi'] + "#{name}!")

loop do #Main Loop
  loop do 
  prompt MESSAGES['first_number']
  number1 = gets.chomp
  
    if valid_number?(number1)
      prompt(MESSAGES['valid_number'] + number1 + "!")
      break
    else 
      prompt(MESSAGES['invalid_number'])
    end 
  end 
  
  loop do 
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp
    if valid_number?(number2)
      prompt(MESSAGES['valid_number'] + number2 + "!")
      break
    else
      prompt(MESSAGES['invalid_number'])
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
      prompt(MESSAGES['invalid_operator'])
    end 
  end 
  
  prompt("#{operation_to_message(operator)}" + MESSAGES['operation_pause_effect'])
  
  result = case operator
          when '1'
            if number1 == number1.to_i.to_s && number2 == number2.to_i.to_s
              result = number1.to_i + number2.to_i
            else 
              result = number1.to_f + number2.to_f
            end 
    
          when '2'
            if number1 == number1.to_i.to_s && number2 == number2.to_i.to_s
              result = number1.to_i - number2.to_i
            else 
              result = number1.to_f - number2.to_f
            end 
    
          when '3'
            if number1 == number1.to_i.to_s && number2 == number2.to_i.to_s
              result = number1.to_i * number2.to_i
            else 
              result = number1.to_f * number2.to_f
            end 
    
          when '4'
            if number2.to_i == 0
              prompt(MESSAGES['divide_by_zero'])
            else
              result = number1.to_f / number2.to_f
            end 
      
  end 
   
  prompt(MESSAGES['result'] + "#{result}")
  
  prompt(MESSAGES["run_again?"])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 

prompt(MESSAGES['goodbye'])