def alphabet_war(fight)

  figth_arr = fight.split("")

  figth_hash = {
    "w" => 4,
    "p" => 3,
    "b" => 2,
    "s" => 1,
    "m" => -4,
    "q" => -3,
    "d" => -2,
    "z" => -1,
  }  
   
  result = figth_arr.reduce(0) do |result, punch|
    points = figth_hash[punch]    
    if !points
      result
    else
      result + figth_hash[punch]
    end    
  end
  
  if result > 0
    "Left side wins!"
  elsif result < 0
    "Right side wins!"
  else 
    "Let's fight again!"
  end  
end

puts alphabet_war("zdqmwpbs") # => "Let's fight again!"