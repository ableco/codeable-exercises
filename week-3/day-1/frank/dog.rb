files = ARGV
content = ""

files.each do |file|
  if File.file?(file)
    content = content + File.read(file)
  else
    puts "dog: #{file}: There is no file"
  end  
end

puts content
File.write('content.txt', content)
