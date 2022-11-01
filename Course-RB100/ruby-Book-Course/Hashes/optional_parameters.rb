#Optional_parameters

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and im #{options[:age]}" +
    " years old and I live in #{options[:city]}"
  end 
end 

greeting("Chase")
greeting("Chase", age: 25, city: "San Francisco")