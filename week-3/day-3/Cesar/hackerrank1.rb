require 'prime'

palindrome = -> (number) do
    number.to_s == number.to_s.reverse
end

palindrome_prime = -> (ary_size) do
(1..Float::INFINITY).lazy.select{|x|x.prime? && palindrome.(x)}.first(ary_size)
end

ary_size = gets.strip.to_i
print palindrome_prime.(ary_size)