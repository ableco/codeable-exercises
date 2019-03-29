# Use of blocks in Ruby, using Yield and how to share its values.

def my_method
  value = yield
  puts "value is: #{value}"
end

my_method do
  2
end
