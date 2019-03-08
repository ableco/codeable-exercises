require_relative "web_api_methods"

#Get info from apis
characters = get_data("https://swapi.co/api/people/")

films = get_data("https://swapi.co/api/films/")

planets =  get_data("https://swapi.co/api/planets/")

#Filter the data that we only need
names = []
characters_modified = characters.map do |value|
    {
        name: value["name"],
        films: value["films"],
        gender: value["gender"],
        id: value["url"]
    }
end

films_modified = films.map do |value|
    {
        episode_id: value["episode_id"],
        title: value["title"],
        director: value["director"],
        release: value["release_date"],
        characters: value["characters"],
        id: value["url"]
    }
end

planets_modified = planets.map do |value|
    {
        name: value["name"],
        residents: value["residents"],
        id: value["url"]
    }
end