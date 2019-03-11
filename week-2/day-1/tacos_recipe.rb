require "http"
require "json"

taco = HTTP.get("http://taco-randomizer.herokuapp.com/random/")
taco_parse = JSON.parse(taco)


taco_parse.each do |key, value| 
    # puts value["name"]
    puts value["recipe"]
end