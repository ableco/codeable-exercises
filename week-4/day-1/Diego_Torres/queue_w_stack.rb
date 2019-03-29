require "./stack.rb"

class Queue

  def initialize
    @s1 = Stack.new
    @s2 = Stack.new
  end

  def enqueue(x)
    until @s2.empty? do
      @s1.push(@s2.pop)
    end
    @s1.push(x)
    until @s1.empty? do
      @s2.push(@s1.pop)
    end
  end

  def dequeue
   @s2.pop
  end

  def peek
   @s2.peek
  end

  def length
   @s2.length
  end

  def empty?
   @s2.empty?
  end

  def show
    @s2.data
  end

end

 queue = Queue.new
 puts queue.show.to_s
 queue.enqueue(1)
 puts queue.show.to_s
 queue.enqueue(2)
 puts queue.show.to_s
 queue.enqueue(3)
 puts queue.show.to_s
 queue.dequeue
 puts queue.show.to_s
 queue.dequeue
 puts queue.show.to_s
 queue.dequeue
 puts queue.show.to_s
 puts queue.empty?