class MyStack
  # Initialize your data structure here.
  def initialize()
    @store = Array.new
  end

  # Push element x onto stack.
  def push(x)
    @store.push(x)
  end

  # Removes the element on top of the stack and returns that element.
  def pop()
    @store.pop
  end

  # Get the top element.
  def top()
    @store.last
  end

  # Returns whether the stack is empty.
  def empty()
    @store.count <= 0
  end
end
  
  # Your MyStack object will be instantiated and called as such:
  # obj = MyStack.new()
  # obj.push(x)
  # param_2 = obj.pop()
  # param_3 = obj.top()
  # param_4 = obj.empty()