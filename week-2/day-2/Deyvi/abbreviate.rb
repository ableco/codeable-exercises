=begin
Write a function to convert a name into initials. This kata 
strictly takes two words with one space in between them.

The output should be two capital letters with a dot seperating them.

It should look like this:
Sam Harris => S.H
Patrick Feeney => P.F  

=end

def name_trimmer(array)
  array.split(" ").map{|val| val[0]}.join(".")
end

puts name_trimmer("Don Pepito")