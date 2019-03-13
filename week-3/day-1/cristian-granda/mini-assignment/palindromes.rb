def find_palindromes
  palindromes = ""
  File.read("phrases.txt").each_line do |line|
      temp_line = line.downcase
      temp_line.gsub!(/[\W_]/, "")
      if temp_line.reverse == temp_line
          palindromes << line + "\n"
      end
  end
  palindromes
end

def save_palindromes
  File.open("palindromes.txt", "w") do |file|
    file.write(find_palindromes)
  end
end

save_palindromes
