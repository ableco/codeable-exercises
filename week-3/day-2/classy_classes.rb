class Person
  # attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def info
    "#{@name}s age is #{@age}"
  end

end

names=["john","matt","alex","cam"]
ages=[16,25,57,39]



4.times do |i|
  person = Person.new(names[i], ages[i])
  puts person.info
end