def alphabet_war(fight)
  base = {"w"=> 4, "p"=> 3, "b"=> 2, "s"=> 1, "m"=> -4, "q"=> -3, "d"=> -2, "z"=> -1}
  result = fight.chars.reduce(0) { |sum, val|   sum + base[val].to_i  }
  if result < 0
    "Right side wins!"
  elsif result > 0
    "Left side wins!"
  else
    "Let's fight again!"
  end
end