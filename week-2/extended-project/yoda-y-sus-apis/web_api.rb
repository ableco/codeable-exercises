require_relative "web_api_methods"

# Get information from APIs and Webs
#=====================================================
characters = get_data("https://swapi.co/api/people/")
films = get_data("https://swapi.co/api/films/")
planets =  get_data("https://swapi.co/api/planets/")
species = get_data("https://swapi.co/api/species/")
initialization_scrapping


# Filter the data that we only need
#=====================================================
# characters
#
# name    : string
# films   : array
# gender  : string
# species : array
# id      : string

characters_modified = characters.map do |value|
  {
    name: value["name"],
    films: value["films"],
    gender: value["gender"],
    species: value["species"],
    id: value["url"]
  }
end

# films
#
# episode_id : integer
# title      : string
# director   : string
# release    : string
# characters : array
# id         : string
#

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

# planets
#
# name      : string
# residents : array
# id        : string

planets_modified = planets.map do |value|
  {
    name: value["name"],
    residents: value["residents"],
    id: value["url"]
  }
end

# species
# name : string
# id   : string

species_modified = species.map do |value|
  {
    name: value["name"],
    id: value["url"]
  }
end

#Convert data to information
#=====================================================
# Attach all the string content about SW characters
# Required content: films played by each character
#										specie which each character belongs

character_final = characters_modified.map do |value|
	films_character = value[:films]
	# catching film's titles and number of episodes
  new_value = films_character.map do |film_id|
									index = films_modified.index { |film| film[:id] == film_id }
									film_match = films_modified[index]
                  "Episode " + film_match[:episode_id].to_s + ": " + film_match[:title]
              end
	# catching specie name
  index_species = species_modified.index { |specie| specie[:id] == value[:species][0] }
  
	# delivering data
  value[:films] = new_value.sort.join("|")
  value[:species] = index_species != nil ? species_modified[index_species][:name] : "Without specie"
  value
end

# Attach all the string content about SW films
# Required content: characters that appear in each film
#										films' titles

films_final = films_modified.map do |value|
  character_film = value[:characters]
  new_value=[]
# catch characters names in planet
  new_value[0] = character_film.map do |character_id|
    index = characters_modified.index { |character| character[:id] == character_id }
    characters_modified[index][:name]
  end
# catching characters genders in planet
  new_value[1] = character_film.map do |character_id|
    index = characters_modified.index { |character| character[:id] == character_id }
    characters_modified[index][:gender]
	end
# catching score of film
	score = get_score(value[:title])
# delivering data
	value[:characters] = new_value[0].sort.join("|")
  value[:score] = score
  value[:gender_count] = new_value[1].group_by {|e| e}.map{|k, v| "#{k} - #{v.length}"}.join("|")
  value
end

# Attach all the string content about SW planets
# Required content: characters that appear in each planet

planets_final = planets_modified.map do |value|
  character_planet = value[:residents]
  new_value = []
  # catching character name
  new_value[0] = character_planet.map do |character_id|
    index = characters_modified.index { |character| character[:id] == character_id }
    characters_modified[index][:name]
  end
  # catching character specie
  new_value[1] = character_planet.map do |character_id|
		index = characters_modified.index { |character| character[:id] == character_id }
		character_match = characters_modified[index]
    character_match[:species] != nil ? character_match[:species] : "Without specie"
  end
# delivering requested data
  value[:residents] = new_value[0].sort.join("|")
  value[:species_count] = new_value[1].group_by {|e| e}.map{|k, v| "#{k} - #{v.length}"}.join("|")
  value
end

#Send information to csv file to store them
#=====================================================
header_character = ["character_name",
										"character_films",
										"character_gender",
										"character_id"]
header_films = ["film_number",
								"film_title",
								"film_director",
								"film_release_date",
								"film_characters",
								"film_id",
								"film_score",
								"film_gender_distrib" ]
header_planet = ["planet_name",
								 "planet_residents",
								 "planet_id",
								 "planet_species_distrib"]
create_file(character_final, header_character, "characters_sw")
create_file(films_final, header_films, "films_sw")
create_file(planets_final, header_planet, "planets_sw")


#View information
#=====================================================
puts "Welcome to the Wiki Star Wars"
puts ""*50
puts "Next we will present some data of different things of this saga"
puts "\n\n"
puts "List of Character"
puts "-"*50

list_character = character_final.reduce("") do |text, val|
										text += val[:name].upcase
										text += "\n\t- Gender: " + val[:gender].upcase
										text += "\n\t- Specie: " + val[:species].upcase
										text += "\n\t- Films where He o She appear:\n"
										array_films = val[:films].split("|")
										text += array_films.reduce("") { |films, film| films + "\t\t" + film + "\n"}
										text += "\n"
								 end
puts list_character
puts "\n"
puts "List of Films"
puts "-"*50
list_films = films_final.reduce("") do |text, val|
							 text += "EPISODE " + val[:episode_id].to_s + ": " + val[:title].upcase
							 text += "\n\t- Director: " + val[:director].upcase
							 text += "\n\t- Release Date: " + val[:release]
							 text += "\n\t- Score according to CNET: " + val[:score]
							 text += "\n\t- Characters who appear here:\n"
							 array_characters = val[:characters].split("|")
							 text += array_characters.reduce("") { |chars, char| chars + "\t\t" + char + "\n"}
							 text += "\n\t- Gender of character - Total in this movie:\n"
							 array_gender = val[:gender_count].split("|")
							 text += array_gender.reduce("") { |genders, gender| genders + "\t\t" + gender + "\n"}
							 text += "\n"
						 end
puts list_films