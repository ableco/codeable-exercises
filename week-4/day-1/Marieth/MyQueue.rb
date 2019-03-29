class MyQueue

    # =begin
    #     Initialize your data structure here.
    # =end
        def initialize(queue=[])
            @queue=queue
        end

    # =begin
    #     Push element x to the back of queue.
    #     :type x: Integer
    #     :rtype: Void
    # =end
        def push(x)
            @queue << x
        end   
    # =begin
    #     Removes the element from in front of queue and returns that element.
    #     :rtype: Integer
    # =end
        def pop()
            @queue.delete_at(0)
            @queue
        end
    # =begin
    #     Get the front element.
    #     :rtype: Integer
    # =end
        def peek()
            @queue.first
        end
      
    # =begin
    #     Returns whether the queue is empty.
    #     :rtype: Boolean
    # =end
        def empty()
            @queue.empty?
        end
    end
    
    # Your MyQueue object will be instantiated and called as such:
     obj = MyQueue.new()
     array = obj.push("a")
     array = obj.push("b")
     array = obj.push("c")
     puts array.inspect
     puts array = obj.peek()
     puts array = obj.pop()
     puts array.inspect
     puts array = obj.peek()
    puts  param_4 = obj.empty()