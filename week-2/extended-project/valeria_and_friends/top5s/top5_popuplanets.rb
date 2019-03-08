require "json"

def top_populated_planets
    response = HTTP.get("https://swapi.co/api/planets/")

    result = JSON.parse(response)["results"]

    population = result.map { |po| po["population"] }

    top5 = []

    population.map! do |po|
        (po == "unknown") ? 0 : po.to_i
    end

    5.times {
        index_max = population.index(population.max)
        top5 << result[index_max]
        result.delete_at(index_max)
        population.delete_at(index_max)
    }

    top5.map! do |p2|
        lol = []
        lol << p2["name"]
        lol << p2["population"]
        lol << p2["diameter"]
        lol
    end

    headers = %w(name population diameter)
    top5.prepend(headers)
end