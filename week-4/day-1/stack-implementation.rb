class MyStack

  def initialize()
    @stack = []
  end

  def push(x)
    @stack.push(x)
  end

  def pop()
    @stack.pop()
  end

  def top()
    @stack[-1] 
  end

  def empty()
    @stack.empty?
  end

end
  

x = 10
obj = MyStack.new()
obj.push(x)
param_2 = obj.pop()
param_3 = obj.top()
param_4 = obj.empty()