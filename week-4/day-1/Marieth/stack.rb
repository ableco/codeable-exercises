class MyStack

    # =begin
    #     Initialize your data structure here.
    # =end
        def initialize(stack=[])
            @stack=stack            
        end
    
    # =begin
    #     Push element x onto stack.
    #     :type x: Integer
    #     :rtype: Void
    # =end
        def push(x)
            @stack << x
        end
    
    
    # =begin
    #     Removes the element on top of the stack and returns that element.
    #     :rtype: Integer
    # =end
        def pop()
            a=@stack.length
           @stack.delete_at(a-1)
        end
       
    # =begin
    #     Get the top element.
    #     :rtype: Integer
    # =end
        def top()
            @stack.last  
        end
    
    
    # =begin
    #     Returns whether the stack is empty.
    #     :rtype: Boolean
    # =end
        def empty()
            @stack.empty?           
        end
    
    end
    
    # Your MyStack object will be instantiated and called as such:
     obj = MyStack.new()
     puts param_4 = obj.empty()
     array =obj.push("a")
     array =obj.push("b")
     array =obj.push("c")
     array =obj.push("d")
    puts array.inspect
    puts obj.top
    array = obj.pop()
    puts array.inspect
    puts param_3 = obj.top()
    puts param_4 = obj.empty()