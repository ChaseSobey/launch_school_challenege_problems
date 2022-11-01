a = [1, 2, 3]

def mutate(array)
  array.pop
end 

p "Before mutate method: #{a}"

p mutate(a)

p "After mutate method: #{a}"

=begin
b = [1, 2, 3]

def no_mutate(array)
  array.last
end 

print "\nBefore no_mutate method: #{b}\n"

puts no_mutate(b)
no_mutate(b)
print "After no_mutate method: #{b}"

=end

#THIS HAS BEEN ADDED AS A TEST FOR MERGING BRANCHES

