$global = "First Line"

class Test
	@@author = "BCG"

	#Always you have to create variable within initialize method
	def initialize
		@user = "User 1"
	end
	

	def show_values
		number_calls = 1
		puts "Local variable: " + number_calls.to_s
		puts "Instance variable: " + @user
		puts "Class variable: " + @@author
		puts "Global variable: " + $global
		$global = "Second Line"
		@@author = "Brayan"
		@user = "User 2"
	end
end


obj_Test1 = Test.new
obj_Test1.show_values
puts "\n"
obj_Test2 = Test.new
obj_Test2.show_values
puts "\n"
obj_Test1.show_values