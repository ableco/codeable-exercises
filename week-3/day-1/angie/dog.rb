content = File.read("./frases.txt") 
  lines = content.split("\n") 
  lines.each do |line|
    puts line
  end 

  lines = File.readlines("frases.txt") # la variable lines , contiene un array
  lines.each do |line|
    puts line
  end

#ESTOS ESTAN COMO COMENTARIO PARA QUE NO CORRAN AUN
#IO.write("file_name.txt", your_array.join("\n"))

# def palindro?(string)
#     string===string.reverse
# end




