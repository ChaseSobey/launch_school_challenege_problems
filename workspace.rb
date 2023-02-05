def permutations(string)
  return [string] if string.length <= 1

  result = []
  string.each_char.with_index do |char, index|
    rest_of_string = string[0...index] + string[index+1..-1]
    permutations(rest_of_string).each do |perm|
      result << char + perm
    end
  end

  result
end

p permutations('cat')