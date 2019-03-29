#https://leetcode.com/problems/implement-stack-using-queues/

class MyStack
    def initialize()
        @data = []
        @head = 0
    end
    
    def push(x)
        @head += 1
        @data[@head] = x
    end
    
    def pop()
        result = @data[@head]
        @data.delete_at(@head)
        @head -= 1
        result
    end
    
    def top()
        @data[@head]
    end
    
    def empty()
        @head == 0
    end
end
    
# Your MyStack object will be instantiated and called as such:
obj = MyStack.new()
obj.push(3)
param_2 = obj.pop()
param_3 = obj.top()
param_4 = obj.empty()
puts obj