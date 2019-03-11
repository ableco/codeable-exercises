require_relative "web_api_methods"

characters = get_data("https://swapi.co/api/people/")

films = get_data("https://swapi.co/api/films/")

planets =  get_data("https://swapi.co/api/planets/")

puts "Number of characters: #{characters.length}"
puts "Number of films: #{films.length}"
puts "Number of plantes: #{planets.length}"
names = []
new_characters = characters.map do |value|
    {
        name: value["name"],
        films: value["films"],
        gender: value["gender"],
        id: value["url"].sub("https://swapi.co/api/people/", "").sub("/", "")
    }
end
create_file(new_characters,)

new_films = films.map do |value|
    {
        episode_id: value["episode_id"],
        title: value["title"],
        director: value["director"],
        release: value["release_date"],
        characters: value["characters"],
        id: value["url"].sub("https://swapi.co/api/people/", "").sub("/", "")
    }
end

new_planets = planets.map do |value|
    {
        name: value["name"],
        residents: value["residents"],
        id: value["url"].sub("https://swapi.co/api/people/", "").sub("/", "")
    }
end

