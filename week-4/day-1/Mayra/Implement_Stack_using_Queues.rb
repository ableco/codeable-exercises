class MyStack

    def initialize()
        @store = Array.new
        @top = -1
    end
    
    def push(x)
        if  x.nil?
            nil
        else
            @top = @top.succ
            @store[@top] = x
            self
        end
        
    end
    
    def pop()
        if empty()
            nil
          else
            popped = @store[@top]
            @store[@top] = nil
            @top = @top.pred
            popped
        end
        
    end

    def top()
        @store[@top]
    end
    
    def empty()
    @top == -1
    end
    
    
    end
    
# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()