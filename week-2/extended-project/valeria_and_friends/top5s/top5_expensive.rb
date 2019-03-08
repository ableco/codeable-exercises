require "http"
require "json"

def top_expensive_vehicles

  # data = File.open("./jsons/vehicles.json")
  # response = ""
  # data.each do |x|
  #   response << x
  # end
  # data.close

  response = HTTP.get("https://swapi.co/api/vehicles/")

  results = JSON.parse(response)["results"]

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

  headers = %w(name cost_in_credits manufacturer cargo_capacity)
  top5.prepend(headers)
end