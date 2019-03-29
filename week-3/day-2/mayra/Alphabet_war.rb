# Introduction
# There is a war and nobody knows - the alphabet war!
# There are two groups of hostile letters. 
# The tension between left side letters and right side letters was too high and the war began.
# Task
# Write a function that accepts fight string consists of only small letters and return who wins the fight. 
# When the left side wins return Left side wins!, when the right side wins return Right side wins!, in other case return Let's fight again!.
# The left side letters and their power:
#  w - 4
#  p - 3
#  b - 2
#  s - 1
# The right side letters and their power:
#  m - 4
#  q - 3
#  d - 2
#  z - 1
# The other letters don't have power and are only victims.
# Example
# AlphabetWar("z");        //=> Right side wins!
def alphabet_war(fight)
t_left_points = 0
t_right_points = 0
#left side
t_left=fight.tr("wpbs","4321")
final_left=t_left.gsub(/\D/,"0")
final_left.split("").map { |n| t_left_points += n.to_i }
#right side
t_right=fight.tr("mqdz","4321")
final_right=t_right.gsub(/\D/,"0")
final_right.split("").map { |n| t_right_points += n.to_i }

if t_left_points > t_right_points
    puts "Left side wins!"
elsif t_left_points < t_right_points
    puts "Right side wins!"
else
    puts "Let's fight again!"
end
end
alphabet_war("z")



# describe "Basic tests" do
#     Test.assert_equals(alphabet_war("z"), "Right side wins!")
#     Test.assert_equals(alphabet_war("zdqmwpbs"), "Let's fight again!")
#     Test.assert_equals(alphabet_war("wq"), "Left side wins!")
#     Test.assert_equals(alphabet_war("zzzzs"), "Right side wins!")
#     Test.assert_equals(alphabet_war("wwwwww"), "Left side wins!")
# end