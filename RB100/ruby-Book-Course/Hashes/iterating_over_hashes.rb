# iterating over hashes

person = {name: 'bob', height: '6 ft', weight: '160lbs', hair: 'brown'}

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end 
