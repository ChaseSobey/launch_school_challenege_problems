def countdown(start)
  puts start
  if start > 0
    countdown(start -1)
  end 
end 

countdown(10)
countdown(-10)
countdown(0)