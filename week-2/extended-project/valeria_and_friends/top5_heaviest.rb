require "json"

ñaña = File.new("people.json")

peoplee = ""
ñaña.each do |ppp|
    peoplee << ppp
end
ñaña.close

result = JSON.parse(peoplee)["results"]

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

puts top5.inspect