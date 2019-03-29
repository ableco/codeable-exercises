# https://leetcode.com/problems/implement-queue-using-stacks/
class MyQueue

    =begin
        Initialize your data structure here.
    =end
    attr_accessor(:data,:tail)
    def initialize
        @data=[]
        @tail = -1
    end
    
    =begin
        Push element x to the back of queue.
        :type x: Integer
        :rtype: Void
    =end
    def push(x)
        @data<< x
        @tail += 1
    end
    
    =begin
        Removes the element from in front of queue and returns that element.
        :rtype: Integer
    =end
    def pop()
        result = @data[0]
        @data.delete_at(0)
        @tail -= 1
        result
    end
    
    =begin
        Get the front element.
        :rtype: Integer
    =end
    def peek()
        result = @data[0];
        result
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