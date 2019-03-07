require_relative "web_api_methods"

characters = get_data("https://swapi.co/api/people/")

films = get_data("https://swapi.co/api/films/")

planets =  get_data("https://swapi.co/api/planets/")

puts "Number of characters: #{characters.length}"
puts "Number of films: #{films.length}"
puts "Number of plantes: #{planets.length}"
