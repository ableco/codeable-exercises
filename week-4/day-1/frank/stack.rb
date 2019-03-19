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

# Your Stack object will be instantiated and called as such:
obj = Stack.new()
obj.push(9)
obj.push(12)
obj.push(13)
puts obj.inspect
