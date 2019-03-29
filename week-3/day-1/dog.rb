#METHODS:
#******************************************************************
def print(file_string)
  #"file1.txt file2.txt file3.txt ..."
  file_array = file_string.split(" ")
  #["file1.txt","file2.txt","file3.txt", ...]
  result = ""
  #Read all files and acumulate the content on result variable.
  file_array.each do |file|
    result += File.open(file, "r").read
  end
  #Return result with all the files content
  result
end

def copy(file_string, new_file)
  #file_string should have all the content you want to copy on "new_file"
  File.open(new_file, "w") { |file| file.puts print(file_string)}
end

#MAIN
#******************************************************************
#The user should start the program using the following expresions.
#For printing file(s) content:
#ruby dog.rb file_name#1 file_name#2 file_name#3...
#For copying file(s) content to a new file:
#ruby dog.rb file_name#1 file_name#2 file_name#3... copy new_file_name

input_array = ARGV
input_string = input_array.join(" ")

if input_string.scan(/\scopy\s/).any? #the user input include the word " copy " -> execute copy method
  pos = (input_string =~ /\scopy\s/)
  input_string = input_string[0..(pos-1)]
  new_file = input_array[-1]
  copy(input_string,new_file)
else #the user input notinclude the word " copy " -> execute print method
  puts print(input_string)
end