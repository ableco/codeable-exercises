require "http"
require "json"

response = HTTP.get("http://taco-randomizer.herokuapp.com/random/?full-taco=true")
taco_hash = JSON.parse(response)
puts taco_hash["recipe"]
