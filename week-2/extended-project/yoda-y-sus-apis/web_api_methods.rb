require "http"
require "json"
require "csv"

$index_general = 0
$uri = "https://www.cnet.com/es/noticias/ranking-peliculas-star-wars-guerra-de-las-galaxias/"
$response = ""

def initialization_scrapping
  $response = HTTP.get($uri).body.to_s
  text_references = "Ránking de las películas de 'Star Wars' según CNET en Español"
  $index_general = /#{text_references}/ =~ response
end

def get_score(name_movie)
  index_movie = $response.index(name_movie, $index_general)
  index_rating = $response.index(">:", index_movie) + 3
  response[index_rating..(index_rating + 1)]
end

def get_data(page)
    data_next = []
    request = HTTP.get(page)
    data = JSON.parse(request.to_s)["results"]
    page_number = JSON.parse(request.to_s)["next"]
    if page_number
      data_next = get_data(page_number)
    end
    return data + data_next
end

def create_file(input, headers, filename)
  CSV.open(filename + ".csv",'wb') do |data|
    data << headers
    input.each{ |val| data << val.values}
  end
end
