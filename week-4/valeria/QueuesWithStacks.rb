#https://leetcode.com/problems/implement-queue-using-stacks/

class MyQueue
    def initialize()
        @data = []
        @tail = 0
    end

    def push(x)
        @data << x
        @tail += 1
    end

    def pop()
        result = @data[0]
        @data.delete_at(0)
        @tail -= 1
        result
    end

    def peek()
        @data[0]
    end

    def empty()
        @tail == 0
    end
end

# Your MyQueue object will be instantiated and called as such:
obj = MyQueue.new()
obj.push(2)
param_2 = obj.pop()
param_3 = obj.peek()
param_4 = obj.empty()
puts obj