# Create a Global variable named global with any value.
# Create a class called Test.
# Inside the Test class define an Instance and a Class variable (any values)
# Add a method to the Test class and inside create a Local variable and print to the console each variable, after that change the Global, Class and Instance variable to another value (any value).
# Create two instances of your Test class and run the method from both of them and the method from the first instance again.
# **Try to call all the variables!**

$global = "I am everything!"

class Test
    def initialize(class_var, instance_var)
        @@class_var = class_var
        @instance_var = instance_var
    end
    
    def what_are_you(local)
        puts @@class_var + " | " + @instance_var 
        puts "I am #{local}"
        puts $global
    end
    
end

what = Test.new("I am not", "I am who")
puts what.what_are_you("you")

wot = Test.new("Who am I?", "I don't know")
puts wot.what_are_you("?")

