def summation(num)
  [*1..num].reduce(0) { |sum, num| sum + num }
end

puts summation(1)
puts summation(8)
