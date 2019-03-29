require "./queue.rb"

class Stack

  def initialize
   @q1 = Queue.new
   @q2 = Queue.new
  end

  def push(x)
    @q1.enqueue(x)
    until @q2.empty? do
      @q1.enqueue(@q2.dequeue)
    end
    @q2 = @q1
    @q1 = Queue.new
  end

  def pop
    @q2.dequeue
  end

  def peek
    @q2.peek
  end

  def empty?
   @q2.empty?
  end

  def show
    @q2.data
  end

 end

 stack = Stack.new

 puts stack.show.to_s
 stack.push(1)
 puts stack.show.to_s
 stack.push(2)
 puts stack.show.to_s
 stack.push(3)
 puts stack.show.to_s
 stack.pop
 puts stack.show.to_s
 stack.pop
 puts stack.show.to_s
 stack.pop
 puts stack.show.to_s
 
 puts stack.empty?