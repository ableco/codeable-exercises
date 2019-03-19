class MyStack

	def initialize()
		@list = []
	end
  
	def push(x)
			@list << x
	end
  
	def pop
			@list.pop
	end
  
	def top
			@list[@list.length - 1]
	end
  
	def empty
			@list.length == 0
	end
  
end
  
# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()