class Stack
  def initialize
      @store = []  
  end

  def push(item)
    @store.push(item)
  end

  def pop
    @store.pop
  end

  def empty
    @store.empty?
  end
end

def valid_parentheses(string)
  stack = Stack.new
  string = string.gsub(/[^()]/,'')
  puts string
  string.split('').each do |char|
    if char == "("
      stack.push(char)
    elsif stack.pop != "("
      return false
    end
  end
  return stack.empty
end

puts valid_parentheses("hi(hi)()")
