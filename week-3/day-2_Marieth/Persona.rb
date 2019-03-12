class Person
    def initialize(name,age)
      #your code here
      @name=name
      @age=age
      
    end
    
    def info
      "#{@name}s age is #{@age}"
    end
    
  end

  person = Person.new("Juan",25)
  puts person.info