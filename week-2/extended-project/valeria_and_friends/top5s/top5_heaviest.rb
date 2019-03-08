require "json"
require "http"

def top_heavy_ones
    response = HTTP.get("https://swapi.co/api/people/")

    result = JSON.parse(response)["results"]

    peep = result.map { |peop| peop["mass"] }

    top5 = []

    peep.map! { |pps| pps.to_i }

    5.times {
        index_max = peep.index(peep.max)
        top5 << result[index_max]
        result.delete_at(index_max)
        peep.delete_at(index_max)
    }

    top5.map! do |ps|
        group = []
        group << ps["name"]
        group << ps["mass"]
        group << ps["height"]
        group
    end

    headers = %w(name mass height)
    top5.prepend(headers)
end