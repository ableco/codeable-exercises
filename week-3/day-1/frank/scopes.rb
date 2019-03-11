$money = 2000

class Test
  attr_accessor :planet
  @@galaxy = "Via lactea"
  
  def initialize(planet)
    @planet = planet
  end

  def show_variables
    country = "Peru"
    puts "Local variable => #{country}"
    puts "Instance variable => #{@planet}"
    puts "Class variable => #{@@galaxy}"
    puts "Global variable => #{$money}"
    puts "#{'-' * 30}"
  end

  def change_galaxy(galaxy)
    @@galaxy = galaxy
  end
end

test_one = Test.new("Tierra")
test_one.show_variables

$money = 0
test_one.planet = "Marte"
test_one.change_galaxy("Andromeda")
test_one.show_variables

test_two = Test.new("Venus")
test_two.show_variables

test_tree = Test.new("Jupiter")
test_tree.show_variables
