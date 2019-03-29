class MyQueue

=begin
        Initialize your data structure here.
=end
        def initialize()
            @store = Array.new
            @head = 0
            @tail = -1
        end
    
    
=begin
        Push element x to the back of queue.
        :type x: Integer
        :rtype: Void
=end
        def push(x)
            @tail = @tail +1
            @store[@tail] = x
            @store
        end
    
    
=begin
        Removes the element from in front of queue and returns that element.
        :rtype: Integer
=end
        def pop()
            value = @store[@head]
            @store.delete_at(@head)
            @tail = @tail -1
            value
        end
    
    
=begin
        Get the front element.
        :rtype: Integer
=end
        def peek()
            if empty
                nil
            end
            @store[@head]
        end
    
    
=begin
        Returns whether the queue is empty.
        :rtype: Boolean
=end
        def empty()
            @tail == -1
        end
    
    
end
    
    # Your MyQueue object will be instantiated and called as such:
    # obj = MyQueue.new()
    # obj.push(x)
    # param_2 = obj.pop()
    # param_3 = obj.peek()
    # param_4 = obj.empty()

    myqueue = MyQueue.new
    myqueue.push(1)
    myqueue.push(2)
    myqueue.peek
    myqueue.pop
    myqueue.empty