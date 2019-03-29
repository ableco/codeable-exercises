class Stack
  attr_accessor :data

  def initialize
   @data = []
  end

  def push(x)
   @data.push x
  end

  def pop
    @data.pop
  end

  def peek
    @data.last
  end

  def empty?
   @data.empty?
  end

 end

#  stack = Stack.new
#  puts stack.data.to_s
#  stack.push(1)
#  puts stack.data.to_s
#  stack.push(2)
#  puts stack.data.to_s
#  stack.push(3)
#  puts stack.data.to_s
#  stack.pop
#  puts stack.data.to_s
#  stack.pop
#  puts stack.data.to_s
#  stack.pop
#  puts stack.data.to_s
#  puts stack.empty?