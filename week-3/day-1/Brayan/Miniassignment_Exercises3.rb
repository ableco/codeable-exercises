require "fileutils"

#Validate if file exists

begin
    filename = "palindromes_file.txt"
    File.delete(filename) if File.exists?(filename)
    puts "File was deleted succesful"
    FileUtils.rm filename
rescue Exception
    puts "The file that you intent to delete doesn't exist"
end