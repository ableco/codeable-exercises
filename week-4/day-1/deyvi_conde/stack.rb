class Stack
  attr_accessor(:data,:head)
  def initialize
    @data= []
    @head= -1
  end

  def push a
    @data<<a
    @head += 1
  end

  def pop
    result = @data[@head]
    @data.delete_at(@head)
    @head -= 1
    result
  end

  def empty?
    @head == -1
  end
end

myStack = Stack.new
myStack.push(4)
myStack.push(10)
myStack.push(20)
myStack.empty?


puts myStack.data
