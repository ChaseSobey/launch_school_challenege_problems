#passing_proc.rb

def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end 
end 

proc = Proc.new do |num|
  puts "#{num}. Proc being called in this method!"
end 

take_proc(proc)