require 'fileutils'

file_name = "palindromes_file.txt"

# Program With exceptions
begin
  FileUtils.rm([file_name])
rescue Exception
  puts "File not found"
end
