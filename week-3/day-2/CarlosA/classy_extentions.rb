class Animal
end

class Cat < Animal

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} meows."
  end

end

cat = Cat.new("Mr. Whiskers")

puts cat.speak