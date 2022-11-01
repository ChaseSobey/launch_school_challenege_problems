#11

#contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

#contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
=begin
# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[0][0]
contacts["Sally Johnson"][:address] = contact_data[0][1]
contacts["Sally Johnson"][:phone] = contact_data[0][2]

p contacts

#12

p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]
=end

#13
=begin
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |word| word.start_with?('s') }
p arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |word| word.start_with?('s', 'w') }
p arr
=end

#14
=begin
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a = a.map {|pairs| pairs.split(" ") }
p a.flatten
=end

#15

#16
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx| 
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end 
end 

p contacts  