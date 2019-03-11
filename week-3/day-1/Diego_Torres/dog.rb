def print(file_string)
  #"file1.txt file2.txt file3.txt"
  file_array = file_string.split(" ")
  #["file1.txt","file2.txt","file3.txt"]
  result = ""
  file_array.each do |file|
    result += File.open(file, "r").read
  end
  result
end

def copy(file_string, new_file)
  File.open(new_file, "w") { |file| file.puts print(file_string)}
end

input_array = ARGV
input_string = input_array.join(" ")

if input_string.scan(/\scopy\s/).any?
  pos = (input_string =~ /\scopy\s/)
  input_string = input_string[0..(pos-1)]
  new_file = input_array[-1]
  copy(input_string,new_file)
else
  puts print(input_string)
end