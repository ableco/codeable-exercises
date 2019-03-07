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

costs = results.map { |item| item["cost_in_credits"] }

costs.map! do |cost|
  (cost == "unknown") ? 0 : cost.to_i
end

top5 = []


5.times {
  index_maxi = costs.index(costs.max)
  top5 << results[index_maxi]
  results.delete_at(index_maxi)
  costs.delete_at(index_maxi)
}

top5.map! do |item|
  temp = []
  temp << item["name"]
  temp << item["cost_in_credits"]
  temp << item["manufacturer"]
  temp << item["cargo_capacity"]
  temp
end

puts top5.inspect