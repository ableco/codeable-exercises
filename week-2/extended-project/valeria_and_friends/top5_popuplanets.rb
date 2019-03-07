require "json"

popuu = File.open("planets.json")

popu = ""
popuu.each do |pp|
    popu << pp
end
popuu.close

result = JSON.parse(popu)["results"]

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

puts top5.inspect