require_relative "dog_operation"

dog = Dog.new()

while true
    input = gets.chomp
    operation(input,dog)
end