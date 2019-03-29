# Exercise

# Create a Global variable named global with any value.
#   Create a class called Test.
#   Inside the Test class define an Instance and a Class variable (any values)
#   Add a method to the Test class and inside create a Local variable and print to the console each variable, after that change the Global, Class and Instance variable to another value (any value).
#   Create two instances of your Test class and run the method from both of them and the method from the first instance again.
#   **Try to call all the variables!**

$global = "global_var"

class Test
  attr_accessor :inst_var
  attr_accessor :clas_var

  def initialize(inst_var = "instace_var")
    @inst_var
  end

  @@clas_var = "class_var"

  def testing(local_var = "local_var")
    just_var = local_var
    puts "local en clase demo: #{just_var}"
    just_var
  end

end

# First round
test = Test.new
puts "\nFirst Round"
puts "-"*15
print "Global Var: #{$global}\n"
print "Instance Var: #{test.inst_var}\n"
print "Class Var: #{test.clas_var}\n"
print "Class Instance local Var: #{test.testing}\n"

# Second round
$global = "new Global_var"
test.inst_var = "new Instance_var"
test.clas_var = "new Class_var"
test.testing("new local_var")

puts "\nSecond Round"
puts "-"*15
print "Global Var: #{$global}\n"
print "Instance Var: #{test.inst_var}\n"
print "Class Var: #{test.clas_var}\n"
print "Class Instance local Var: #{test.testing}\n"

testA = Test.new()
testB = Test.new()

puts "\nThird Round"
puts "-"*15
print "Class test Instance local Var: #{test.testing}\n"
print "Class test1 Instance local Var: #{testA.testing}\n"
print "Class test2 Instance local Var: #{testB.testing}\n"