lines_array = []

File.open("phrases.txt", "r") do |f|  
  f.each_line do |line|
    lines_array << line
  end
end

words_string = lines_array.join("")

words_array = words_string.split(/\W+/)

words_array.delete_if {|x| (x != x.reverse) || !!(/^[^aeiouAEIOU]$/.match(x)) } 

puts content =  words_array.join("\n")

File.open('palindromes.txt' , 'w') do |new_file|
  new_file.write(content)
end