class MyQueue

	def initialize()
			@list = []
	end

	def push(x)
			@list << x
	end

	def pop()
			@list.shift
	end

	def peek()
			@list[0]
	end

	def empty()
			@list.length == 0
	end
end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()