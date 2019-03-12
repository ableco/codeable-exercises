class Animal
    def initialize(name)
        #your code here
        @name=name
        
      end
end    

class Cat < Animal
    #your code here
    def speak
    "#{@name} meows."
    end  
  end

  gatito=Cat.new("Juan")

  puts gatito.speak