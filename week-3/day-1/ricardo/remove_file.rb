require 'fileutils'

path = 'palindromes.txt'

if File.exist?(path)
  FileUtils.rm(path)
end

#triying to remove if doesn't exist
begin
  FileUtils.rm(path)
rescue
  puts "el path no existe"
end
