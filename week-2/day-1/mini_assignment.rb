#de Diego C y Valeria

require "http"
require "json"

lol = HTTP.get("https://api.tronalddump.io/random/quote")
lolol = JSON.parse(lol)
meme = HTTP.get("https://api.tronalddump.io/random/meme")
#memelol = JSON.parse(meme)

puts lolol["value"] #&& meme
puts meme
