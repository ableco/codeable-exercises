class MyQueue
  def initialize
    @queue = []
  end

  def push(x)
    @queue.push(x)
  end

  def pop()
    @queue.shift
  end

  def peek()
    @queue.first
  end

  def empty()
    @queue.empty?
  end

end

obj = MyQueue.new()
obj.push(12)
puts param_2 = obj.pop()
puts param_3 = obj.peek()
puts param_4 = obj.empty()