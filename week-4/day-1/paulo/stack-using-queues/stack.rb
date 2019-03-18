class MyStack

  def initialize()
      @data = []
  end

  def push(x)
      @data.push(x)
  end

  def pop()
      @data.pop
  end

  def top()
      @data.last
  end

  def empty()
      @data.empty?
  end

end