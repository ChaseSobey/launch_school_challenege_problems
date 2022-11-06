# HIGH LEVEL PSEUDO CODE #

# Get loan amount, annual percentage rate (APR) and loan duration in years from user
# convert APR and loan duration from years into months
# plug all values into provided equation for monthly loan payment
# display monthly loan payment

## LOW LEVEL PSEUDO CODE ##

# START

# GET loan_amount = Loan amount
# GET apr = APR
# GET loan_duration_years = loan duration in years

# SET loan_duration_months = loan_duration_years * 12
# SET monthly_interest = apr / 12

# SET monthly_payment = all values plugged into monthly interest equation

# PRINT value of monthly_payment

### START OF CODE ###

puts 'Please enter loan amount.'
loan_amount = gets.chomp.to_f

puts 'Please enter APR without % sign'
apr = gets.chomp.to_f

puts 'Please enter loan duration in years'
loan_duration_years = gets.chomp.to_f

# Conversions

monthly_interest = apr / 100 / 12
loan_duration_months = loan_duration_years * 12

# Monthly payment calculation

monthly_payment = (loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**-loan_duration_months))).round(2)

puts "Your monthly payment is $#{monthly_payment}"

