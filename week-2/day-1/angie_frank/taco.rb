require "json"
require "http"
require "colorize"

response = HTTP.get("http://taco-randomizer.herokuapp.com/random/")

recipe = JSON.parse(response)

puts "La mezcla \n".cyan
puts recipe["mixin"]["recipe"].colorize(:color => :white, :background => :blue)
puts "\n#{'*' * 25}\n".blue

puts "La salsa \n".cyan
puts recipe["seasoning"]["recipe"].colorize(:color => :white, :background => :blue)
puts "\n#{'*' * 25}\n".blue

puts "La capa base \n".cyan
puts recipe["base_layer"]["recipe"].colorize(:color => :white, :background => :blue)
puts "\n#{'*' * 25}\n".blue

puts "Los condimentos \n".cyan
puts recipe["condiment"]["recipe"].colorize(:color => :white, :background => :blue)
puts "\n#{'*' * 25}\n".blue

puts "La cobertura \n".cyan
puts recipe["shell"]["recipe"].colorize(:color => :white, :background => :blue)
puts "\n#{'*' * 25}\n".blue
