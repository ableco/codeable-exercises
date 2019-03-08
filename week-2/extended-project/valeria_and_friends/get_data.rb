require "http"
require "json"

# response = HTTP.get("https://swapi.co/api/vehicles/")
# results = JSON.parse(response)["results"]

json_raw = File.open("vehicles.json")
data = ""
json_raw.each do |x|
  data << x
end
json_raw.close
results = JSON.parse(data)["results"]

fetch_data(url) => json
get_results(json) => [results]
get_main_attribute([R], string_attribute) => []
parse_values_to_i([]) => [i,i,i]
get_order_by_index([]) => [indices dek mayor a menor]
get_tops([R], [index ordered indexes])