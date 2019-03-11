# Create a Global variable named global with any value
$global = "Hi"

# Create a class called Test
class Test
    # Inside the Test class define an Instance and a Class variable (any values)
    @instance = "Any Value"
    @@class = "Other Any Value"

    # Add a method to the Test class and inside create a Local variable and print to the console each variable, after that change the Global, Class and Instance variable to another value (any value).
    def method
        local = "a local variable"
        puts local
    end
end