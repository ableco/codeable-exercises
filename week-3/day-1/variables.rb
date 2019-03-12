
$global = "Global"

class Test
  @@class = "Class"
  @instance = "Instance"

  def prueba
    local = "Hey I'm local"
    puts local
    all_variables
    $global = "new Global"
    @@class = "new Class"    
    @instance = "new Instance"
    all_variables
  end

  def all_variables
    puts $global
    puts @@class
    puts @instance
  end
end

first_test = Test.new
first_test.prueba

second_test = Test.new
second_test.prueba 


# Create a Global variable named global with any value.
# Create a class called Test.
# Inside the Test class define an Instance and a Class variable (any values)
# Add a method to the Test class and inside create a Local variable and print to the console each variable, 
#after that change the Global, Class and Instance variable to another value (any value).
# Create two instances of your Test class and run the method from both of them and the method from the first instance again.
# **Try to call all the variables!**