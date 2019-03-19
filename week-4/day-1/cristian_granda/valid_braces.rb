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
 
  def top
    @store.last
  end

  def empty
    @store.empty?
  end
end


def valid_braces(string)
  braces = {
    ")" => "(",
    "}" => "{",
    "]" => "[",
  }
  stack = Stack.new
  string.each_char do |char|
    if braces.values.include? char
      stack.push(char)
    elsif braces[char] != stack.pop
      return false
    end
  end
  return stack.empty
end