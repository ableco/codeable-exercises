require "json"

peeps2 = File.open("people.json")

peeps = ""
peeps2.each do |p1|
    peeps << p1
end
peeps2.close

res = JSON.parse(peeps)["results"]

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

puts top5.inspect