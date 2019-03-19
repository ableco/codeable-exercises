class MyStack
        def initialize()
            @store = Array.new
        end
        def push(x)
            @store.push(x)
        end
    
        def pop()
            @store.pop()
        end
    
        def top()
            @store.last
        end
    
        def empty()
            @store.empty?()
        end
    
    
    end
    
    #Your MyStack object will be instantiated and called as such:
    obj = MyStack.new()
    obj.push(1)
    obj.push(2)
    puts param_2 = obj.pop()
    puts param_3 = obj.top()
    puts param_4 = obj.empty()

    