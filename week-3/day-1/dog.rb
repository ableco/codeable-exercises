content=""

ARGV.each do|filename|
if File.exist?(filename)
 content= content + File.read(filename) + " "
else
  puts "no existe la carpeta"
end
end
puts content
File.write("ejemplox.txt", content)
