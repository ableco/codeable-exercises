require 'fileutils'

if File.exist?("palindromes_file.txt")
    FileUtils.rm "palindromes_file.txt"
end