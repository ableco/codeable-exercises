
require 'json'  
require "http"

response = HTTP.get("https://cat-fact.herokuapp.com/facts/random?animal=cat&amount=1").to_s

cats = JSON.parse(response)

response2 = HTTP.get("https://aws.random.cat/meow")

catphoto = JSON.parse(response2)

puts "Info del gato => #{cats["text"]}" 
puts "Foto del gato => #{catphoto["file"]}" 