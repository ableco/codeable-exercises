
require 'prime'

palindrome = -> (number) do
 number.to_s == number.to_s.reverse
end


palindrome_prime =-> (array_size) do 
    (1..FLoat::INFINITY).lazy.select {|x| x.prime? && palindrome.(x)}.first(array_size)
end

array_size= gets.strip.to_i
print palindrome_prime.(array_size)
