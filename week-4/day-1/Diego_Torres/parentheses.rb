require "./stack.rb"

def valid_parentheses(string)
  
  stack = Stack.new
  string.each_char do |x|
    stack.push(x) if x == '('
    stack.pop or return(false) if x == ')'
  end
  stack.empty?
end

puts valid_parentheses("()()()()") #true
puts valid_parentheses("()()()(") #false
puts valid_parentheses(")()()") #false