palindromes = ""

File.read("phrases.txt").each_line do |line|
    temp_line = line.downcase
    #puts temp_line
    temp_line.gsub!(/[\W_]/, "")
    if temp_line.reverse == temp_line
        #puts line + "\n"
        palindromes << line + "\n"
    end
end


File.open("palindromes_file.txt", "w") do |file|
    file.write(palindromes)
end

