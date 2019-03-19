class Stack
  def initialize
    @store = []  
  end

  def push(x)
    @store.push(x)
  end

  def pop
    @store.pop
  end

  def empty
    @store.empty?
  end
end
  
# Your Queue object will be instantiated and called as such:
obj = Queue.new()
obj.push(x)
param_2 = obj.pop()
param_3 = obj.peek()
param_4 = obj.empty()
