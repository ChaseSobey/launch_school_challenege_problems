arr = [1, 2, 3, 4]

p (arr.map do |num|
  puts "this is iteration #{num}"
  num
end)
