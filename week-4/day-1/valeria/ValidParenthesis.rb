# https://www.codewars.com/kata/valid-parentheses/train/ruby

def valid_parentheses(string)
    count = 0

    string.chars.map do |x|
        if x == "("
            count += 1
        elsif x == ")"
            count = count - 1
        end

        if (count < 0) && (x == ")")
            return false
        end
    end
        
      
    if (count == 0)
        return true
    else
        return false
    end
end

puts valid_parentheses("  (")
puts valid_parentheses(")test")
puts valid_parentheses("")
puts valid_parentheses("hi())(")
puts valid_parentheses("hi(hi)()")