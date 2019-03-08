require "json"
require "http"

def top_fastest_vehicles
    response = HTTP.get("https://swapi.co/api/vehicles/")

    results = JSON.parse(response)["results"]

    speed = results.map { |items| items["max_atmosphering_speed"] }

    top5 = []

    speed.map! { |v| v.to_i }

    5.times {
        index_max = speed.index(speed.max)
        top5 << results[index_max]
        results.delete_at(index_max)
        speed.delete_at(index_max)
    }

    top5.map! do |i|
        arr = []
        arr << i["name"]
        arr << i["max_atmosphering_speed"]
        arr << i["vehicle_class"]
        arr << i["cargo_capacity"]
        arr
    end

    headers = %w(name max_atmosphering_speed vehicle_class cargo_capacity)
    top5.prepend(headers)
end