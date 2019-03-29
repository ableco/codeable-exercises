class MyQueue

    def initialize()
    @store = Array.new()   
    end

    def push(x)
        @store.unshift(x)
        self   
    end
    
    def pop()
        @store.pop
    end
    
    # =begin
    #     Get the front element.
    #     :rtype: Integer
    # =end
    def peek()
        @store[-1]
    end
    # =begin
    #     Returns whether the queue is empty.
    #     :rtype: Boolean
    # =end
    def empty()
        @store.empty?
    end
      
end
    
    # Your MyQueue object will be instantiated and called as such:
    # obj = MyQueue.new()
    # obj.push(x)
    # param_2 = obj.pop()
    # param_3 = obj.peek()
    # param_4 = obj.empty()