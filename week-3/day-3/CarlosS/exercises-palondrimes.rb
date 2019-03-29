require "palindrome"
require "prime"

pal_prime = -> (num) do 
    1.upto(Float::INFINITY).lazy.select { |x| x if x.prime? && x.to_s.palindrome?}.first(num)
end

puts pal_prime.(20).inspect    #[1, 4, 9, 16]