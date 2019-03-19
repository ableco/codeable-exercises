class Queue
  attr_accessor(:data,:tail)
  def initialize
    @data=[]
    @tail = -1
  end

  def enqueue a 
    @data<<a
    @tail += 1
  end

  def dequeue
    result = @data[0]
    @data.delete_at(0)
    @tail -= 1
    result
  end

  def empty?
    @tail == -1
  end
end

myQueue = Queue.new
myQueue.enqueue("Sergio")
myQueue.enqueue("Deyvi")
myQueue.enqueue("Lian")
myQueue.dequeue()
puts myQueue.data