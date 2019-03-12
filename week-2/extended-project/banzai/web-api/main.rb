require "http"
require "json"
require "csv"

$base_url = "https://rickandmortyapi.com/api/character/"

def get_characters_data
  characters_data = HTTP.get($base_url)
  characters_data = JSON.parse(characters_data)
  characters_data
end

def show
  get_characters_data["results"].map do |element|
    data = []
    data << element["name"]
    data << element["species"]
    data << element["gender"]
  end
end

def create_csv
  CSV.open('characters.csv', 'w') do |csv_object|
    show.each do |row_array|
      csv_object << row_array
    end
  end
end

create_csv