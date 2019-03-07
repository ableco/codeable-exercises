=begin
    
rescue => exception
    
end
require "http"
require "json"

response = HTTP.get("https://swapi.co/api/vehicles/")
data = JSON.parse(response)

#result = data["results"]



puts 
=end

#require "./vehicles.json"
require "json"

data = File.open("vehicles.json")

data2 = ""
data.each do |x|
    data2 << x
end
data.close

results = JSON.parse(data2)["results"]


puts results