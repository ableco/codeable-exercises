require 'fileutils'

file_name = "palindromes_file.txt"

# Program with File utils
if File.exist?(file_name)
  FileUtils.rm([file_name])
else
  puts "File not found"
end
