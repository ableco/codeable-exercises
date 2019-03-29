require "http"
require "json"

response_cat = HTTP.get("https://cat-fact.herokuapp.com/facts/random")
response = HTTP.get("https://aws.random.cat/meow")
hash = JSON.parse(response_cat)
img = JSON.parse(response)
puts hash["text"]
puts img["file"]