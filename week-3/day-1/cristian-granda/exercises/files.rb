require "json"

def do_something(path, string)
  $hash
  File.open(path, "a+") do |file|
    $hash = JSON.parse(file.read)
    $hash["palabras"].unshift string
    $hash = $hash.to_json
  end
  File.write(path, $hash)
end

def path_json(json_file)
  File.absolute_path(json_file)
end

p path_json("text.json")

do_something(path_json("text.json"), "Hey")

