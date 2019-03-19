class MyStack
  def initialize()
    @stack = []
  end

  def push(x)
    @stack.push(x)
  end

  def pop()
    @stack.pop
  end

  def top()
    @stack.last
  end

  def empty()
    @stack.empty?
  end

end