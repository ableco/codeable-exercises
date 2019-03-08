require "json"
def top_tallest_people
    response = HTTP.get("https://swapi.co/api/people/")

    res = JSON.parse(response)["results"]

    how_tol = res.map { |yo| yo["height"] }

    top5 = []

    how_tol.map! { |h| h.to_i }

    5.times {
        in_max = how_tol.index(how_tol.max)
        top5 << res[in_max]
        res.delete_at(in_max)
        how_tol.delete_at(in_max)
    }

    top5.map! do |h|
        hehe = []
        hehe << h["name"]
        hehe << h["height"]
        hehe << h["gender"]
        hehe
    end

    headers = %w(name height gender)

    top5.prepend(headers)
end