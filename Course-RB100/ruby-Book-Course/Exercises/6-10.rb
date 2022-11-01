#6
=begin
arr = [1,2,2,3,3,3,4,4,4,4,5,5]

arr.uniq!

p arr
=end
#7
# Main diff between array and hash is that array values are accessed by index value/location in array while hash value is accessed by the key associated to the value in question

#8
=begin
hash_old = { :dog => 'bitch', :cat => 'pussy' }

hash_new = { dog: 'woof', cat: 'moo' }

p hash_old[:dog]

p hash_new[:cat]
=end

#9
=begin
h = {a: 1, b: 2, c: 3, d: 4 }

p h[:b]

h[:e] = 5

p h

h.delete_if {|key, value| value < 3.5 }

p h
=end
