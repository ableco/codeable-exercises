require_relative "dog_class"

def operation(user_input, dog)
    if (user_input.scan(/^cat\s/).any?)
        return "Hi"
    else
        return "Error: Unexpected input"
    end
end