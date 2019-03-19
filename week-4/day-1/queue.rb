class MyQueue
 
  # Initialize your data structure here.
  def initialize()
  @a= Array.new
  end
  
#  Push element x to the back of queue.
  def push(x)
  @a.push(x)  
  end

# Removes the element from in front of queue and returns that element.
  def pop()
  @a.shift
  end

#  Get the front element.
  def peek()
  @a.first
  end

#  Returns whether the queue is empty.
  def empty()
  @a.empty? 
  end
end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()