class MyStack

=begin
        Initialize your data structure here.
=end
  def initialize()
    @store = Array.new
    @head = -1
  end
    
    
=begin
        Push element x onto stack.
        :type x: Integer
        :rtype: Void
=end
  def push(x)
      @head = @head +1
      @store[@head] = x
      @store
  end
    
    
=begin
        Removes the element on top of the stack and returns that element.
        :rtype: Integer
=end
  def pop()
      value = @store[@head]
      @store.delete_at(@head)
      @head = @head - 1
      value
  end
    
    
=begin
        Get the top element.
        :rtype: Integer
=end
  def top()
      @store[@head]
  end
    
    
=begin
        Returns whether the stack is empty.
        :rtype: Boolean
=end
  def empty()
      @head == -1
  end

end
    
    # Your MyStack object will be instantiated and called as such:
    # obj = MyStack.new()
    # obj.push(x)
    # param_2 = obj.pop()
    # param_3 = obj.top()
    # param_4 = obj.empty()

stack = MyStack.new

stack.push(1)
stack.push(2)
stack.top
stack.pop
stack.empty