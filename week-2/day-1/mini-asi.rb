require "http"
require "json"

system "clear"
anime = Random.rand(0..6)
# puts anime
resp2 = HTTP.get("https://api.jikan.moe/v3/anime/5/pictures")
ranime = JSON.parse(resp2)

fecha = Random.rand(0..12)
response = HTTP.get("https://date.nager.at/api/v2/PublicHolidays/2019/PE")
rcal = JSON.parse(response)

# puts response
holiday = rcal[fecha]["localName"]
# puts holiday

# puts resp2
# puts ranime["pictures"][0]["large"]
sugerido = ranime["pictures"][anime]["large"]
# puts sugerido

puts "Hoy es #{holiday} y se recomienda ver el siguiente anime: #{sugerido}"