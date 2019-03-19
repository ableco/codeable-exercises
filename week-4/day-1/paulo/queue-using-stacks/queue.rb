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