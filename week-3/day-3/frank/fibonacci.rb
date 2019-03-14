def fibonacci(n)
  a, b = 1 , 2
  sum = 2
  2.upto(n - 1) do |_i|
    c = a + b
    sum = sum + c if c.even?
    a, b = b, c 
  end
  return sum
end

puts fibonacci(ARGV.first.to_i)
