def welcome
  puts "Use 'dog' instead of 'cat'"
end

def get_input_user
  input_user = gets.chomp
  #valid the dog command
  valid_input = /^dog\s\S+/ =~ input_user
  input_user = valid_input ? input_user.gsub!(/^dog\s/, "") : false
end

def launch
  input_user = get_input_user
  if input_user
    system("cat #{input_user}")
    puts "\n"
    launch
  else
    puts "Command not found"
    launch
  end
end

welcome
launch