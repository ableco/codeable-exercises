require_relative "dog_class"

def operation(user_input, dog)
    if (user_input.scan(/^cat\s/).any?)
        op = user_input.split("\s")
        if (op[1].scan(/[>]/).any?)
            return "add file"
        end
    else
        return "Error: Unexpected input"
    end
end