# Exercise

# Create a script that receives the path to a .json file with an array and any string, read the file, parse it as JSON, append the string at the top of the file and write it again to the disk.
# If the files doesn’t exists ask the user if he wants to create it.
# At the end print the content of the file in a table in the console.
# If you get any error show the user a nice message explaining the error.


require "json"

def generate_file
  lista = []
  i = 0
  loop do
    i = i + 1
    peso = Random.rand(60..85)
    lista << peso
  break if i > 5
  end
  {"lista": lista, "titulo": "Lista de Pesos Definidos"}
end

def file_exists(file_name, expected_file)

end

=begin
def get_url(newfile)
  url = gets.chomp
  url
end

def file_read(get_url, content)
  File.read("test_file.json") do |line|
    array_
  end
end

def file_write()
  file = File.open("test_file.json", "w") do |file|
    file.write(arr)
end
=end

puts generate_file