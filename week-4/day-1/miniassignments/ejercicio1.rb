# https://leetcode.com/problems/implement-stack-using-queues/
class MyStack

    =begin
        Initialize your data structure here.
    =end
    attr_accessor(:data,:head)
      def initialize
        @data= []
        @head= -1
      end
    
    
    =begin
        Push element x onto stack.
        :type x: Integer
        :rtype: Void
    =end  
    def push x
        @data << x
        @head += 1
    end
    
    
    =begin
        Removes the element on top of the stack and returns that element.
        :rtype: Integer
    =end
    def pop
        result = @data[@head]
        @data.delete_at(@head)
        @head -= 1
        result
    end

    =begin
        Get the top element.
        :rtype: Integer
    =end
    def top()
        result = @data[@head]
        result
    end
    
    
    =begin
        Returns whether the stack is empty.
        :rtype: Boolean
    =end
    def empty()
        @head == -1
    end
end
    # Your MyStack object will be instantiated and called as such:
    # obj = MyStack.new()
    # obj.push(x)
    # param_2 = obj.pop()
    # param_3 = obj.top()
    # param_4 = obj.empty()