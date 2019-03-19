class MyStack

#Initialize your data structure here.
  def initialize()
      @abc= Array.new
  end

  #Push element x onto stack.
  def push(x)
      @abc.push(x)
  end

  def pop()
      @abc.pop
  end

  def top()
    @abc.last
  end

  #Returns whether the stack is empty.
  def empty()
    @abc.empty?
  end

end

# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()