
words=File.read("archivo.txt").each_line do |line|
    puts line
end
new_words=words.split("\n")

new_array =[]
new_words.each do |val|
    new_val=val.downcase
    new_val.gsub!(/[\W_]/, "")
     if new_val==new_val.reverse
        new_array << val
     end
end


puts new_array.join("\n")

File.open("palindromes_file.txt", "w") do |file|
    file.write(new_array.join("\n"))
 end



