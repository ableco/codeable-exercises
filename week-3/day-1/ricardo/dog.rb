def read_file(path)
  lines_array = []
  File.open(path, "r") do |f|
    f.each_line do |line|
      lines_array << line
    end
  end
  lines_array
end

def read_files(user_input)

  user_input.slice!("dog ")

  array_paths = user_input.split(" ")

  if array_paths.include?(">")
    # example: dog file1 file2 file3 > file0
    array_paths.delete_if {|x| x == ">" } 
    new_file_path = array_paths.pop

    content = ""
    array_paths.each.with_index do |path, index|      
      begin
        content += read_file(path).join('')
        content += "\n"          
      rescue
        puts "the path #{index+1} is wrong"
      end
    end 

    begin
      File.open(new_file_path , 'w') do |new_file|
        new_file.write(content)
      end
    rescue
      puts "the destine path is wrong"
    end

  else
    # example: dog file1 file2 file3
    array_paths.each.with_index do |path, index|
      begin
        puts read_file(path).join('')
      rescue
        puts "the argument #{index+1} is wrong"
      end        
    end
  end

end

def menu  
  print "> "
  input = gets.chomp
  case input
  when /(dog\s)/
    read_files(input)
  when /(clear)/
    system("clear")
  when /(q)/
    exit(0)
  else
    puts "Error: unexpected input"
  end
  menu
end

menu
