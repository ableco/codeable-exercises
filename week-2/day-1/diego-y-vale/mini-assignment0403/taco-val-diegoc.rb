require "http"
require "json"

tac = HTTP.get("http://taco-randomizer.herokuapp.com/random/?full-taco=true").to_s
taco = JSON.parse(tac)

if taco.include?("base_layer")
    base_layer = taco["base_layer"]
    puts base_layer["recipe"]
end

if taco.include?("mixin")
    mixing = taco["mixin"]
    puts mixing["recipe"]
end

if taco.include?("seasoning")
    seasoning = taco["seasoning"]
    puts seasoning["recipe"]
end

if taco.include?("condiment")
    condiment = taco["condiment"]
    puts condiment["recipe"]
end

if taco.include?("shell")
    shell = taco["shell"]
    puts shell["recipe"]
end
