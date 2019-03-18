class MyQueue
  
  def initialize()
    @data = []
  end
  
  def push(x)
    @data.push(x)
  end

  def pop()
    @data.shift
  end
  
  def peek()
    @data.first
  end

  def empty()
    @data.empty?
  end
  
end
  
  # Your MyQueue object will be instantiated and called as such:
  # obj = MyQueue.new()
  # obj.push(x)
  # param_2 = obj.pop()
  # param_3 = obj.peek()
  # param_4 = obj.empty()