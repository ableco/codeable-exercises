class MyQueue

        def initialize()
            @store=Array.new
        end
    
        def push(x)
            @store << x
        end
    
        def pop()
            @store.delete_at(0)
        end
    
        def peek()
            @store.first
        end
    
        def empty()
            @store.empty?
        end
    
    end
    
    # Your MyQueue object will be instantiated and called as such:
    obj = MyQueue.new()
    obj.push(1);
    obj.push(4);
    obj.push(12);
    obj.push(8);
    obj.push(7);
     puts obj.push(6);
     puts "-------------"
     puts param_2 = obj.pop()
    puts param_3 = obj.peek()
     puts param_4 = obj.empty()