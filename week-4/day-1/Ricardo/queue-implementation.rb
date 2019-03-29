class MyQueue

  def initialize()
    @queue = []
  end

  def push(x)
    @queue.push(x)
  end

  def pop()
    @queue.shift()
  end

  def peek()
    @queue[0]
  end

  def empty()
    @queue.empty?
  end

end
  
  # Your MyQueue object will be instantiated and called as such:
  x = 10
  obj = MyQueue.new()
  obj.push(x)
  param_2 = obj.pop()
  param_3 = obj.peek()
  param_4 = obj.empty()