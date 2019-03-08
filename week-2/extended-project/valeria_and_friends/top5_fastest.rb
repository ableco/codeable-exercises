require "json"

lmao = File.open("vehicles.json")

datos = ""
lmao.each do |y|
    datos << y
end
lmao.close

resultados = JSON.parse(datos)["results"]

speed = resultados.map { |items| items["max_atmosphering_speed"] }

top5 = []

speed.map! { |v| v.to_i }

5.times {
    index_max = speed.index(speed.max)
    top5 << resultados[index_max]
    resultados.delete_at(index_max)
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

puts top5.inspect