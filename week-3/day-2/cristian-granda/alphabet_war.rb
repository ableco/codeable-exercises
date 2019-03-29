def alphabet_war(fight)
  @left_side = {
    "w" => 4,
    "p" => 3,
    "b" => 2,
    "s" => 1
  }
  @right_side = {
    "m" => 4,
    "q" => 3,
    "d" => 2,
    "z" => 1 
  }
  win_condition(fight)
end

def left_side_points(fight)
  array_string = fight.split("")
  left_side_points = array_string.map { |letter| @left_side[letter] }
  left_side_points.compact!
  left_side_points = left_side_points.sum
end

def right_side_points(fight)
  array_string = fight.split("")
  right_side_points = array_string.map { |letter| @right_side[letter] }
  right_side_points.compact!
  right_side_points = right_side_points.sum
end

def win_condition(fight)
  if left_side_points(fight) > right_side_points(fight)
    "Left side wins!"
  elsif right_side_points(fight) > left_side_points(fight)
    "Right side wins!"
  else
    "Let's fight again!"
  end
end

p alphabet_war("z")         # => Right side wins!
p alphabet_war("zdqmwpbs")  # => Let's fight again!
p alphabet_war("zzzzs")     # => Right side wins!
p alphabet_war("wwwwwwz")   # => Left side wins!