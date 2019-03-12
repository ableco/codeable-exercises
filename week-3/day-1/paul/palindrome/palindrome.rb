def get_palindromes(name_file)
  data_file = ""

  File.read(name_file).each_line do |line|
    fake_line = line.downcase
    fake_line.gsub!(/[\W_]/, "")
    (data_file << line) if fake_line.reverse == fake_line
  end

  File.open("palindromes_file.txt", "w") do |file|
    file.write(data_file)
  end
end

get_palindromes("find_palindrome.txt")
