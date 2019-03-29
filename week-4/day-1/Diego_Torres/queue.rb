class Queue
  attr_accessor :data

  def initialize
   @data = []
  end

  def enqueue(x)
   @data << x
  end

  def dequeue
   @data.shift
  end

  def peek
   @data.first
  end

  def length
   @data.length
  end

  def empty?
   @data.empty?
  end

end

#  queue = Queue.new
#  puts queue.data.to_s
#  queue.enqueue(1)
#  puts queue.data.to_s
#  queue.enqueue(2)
#  puts queue.data.to_s
#  queue.enqueue(3)
#  puts queue.data.to_s
#  queue.dequeue
#  puts queue.data.to_s
#  queue.dequeue
#  puts queue.data.to_s
#  queue.dequeue
#  puts queue.data.to_s
#  puts queue.empty?