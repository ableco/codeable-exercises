# https://www.codewars.com/kata/valid-braces/train/ruby

PARENS = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
}
  
OPENING = PARENS.keys
CLOSING = PARENS.values
  
def validBraces(braces)
    stack  = []
    
      braces.each_char do |x|
      if OPENING.include?(x)
        stack << x
      elsif CLOSING.include?(x)
        x == PARENS[stack.last] ? stack.pop : (return false)
      end
    end
    stack.empty?
end

puts validBraces( "()" )
puts validBraces( "[(])" )