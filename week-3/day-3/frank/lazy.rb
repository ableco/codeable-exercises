# Enter your code here. Read input from STDIN. Print output to STDOUT
require "prime"

prime_array = -> (array_size) do 
  1.upto(Float::INFINITY).lazy.select do |x|
     x == x.to_s.reverse.to_i && x.prime?
  end.first(array_size) 
end

num = gets.to_i

puts prime_array.(num).inspect
