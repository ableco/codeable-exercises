require_relative 'stack'
require_relative 'queue'

# Test Stack
obj = DataStructureStack.new
puts "Add value \"1\""
obj.add_list("1")
puts "Add value \"2\""
obj.add_list("2")
puts "Add value \"3\""
obj.add_list("3")
puts "Add value \"4\""
obj.add_list("4")
puts "The List has the following elements"
puts obj.show_list
puts "Deleting value"
puts obj.delete_list
puts "The List has the following elements"
puts obj.show_list
puts "Deleting value"
puts obj.delete_list



obj = DataStructureQueue.new
puts "Add value \"1\""
obj.add_list("1")
puts "Add value \"2\""
obj.add_list("2")
puts "Add value \"3\""
obj.add_list("3")
puts "Add value \"4\""
obj.add_list("4")
puts "The List has the following elements"
puts obj.show_list
puts "Deleting value"
puts obj.delete_list
puts "The List has the following elements"
puts obj.show_list
puts "Deleting value"
puts obj.delete_list

