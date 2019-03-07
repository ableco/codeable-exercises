# define global variable
$bd_name = "bd.txt"

def read_file
  File.read($bd_name).split("\n").map { |line| line.split("-").map(&:strip) }
end

def save_file(tasks)
  newTasks = tasks.map { |fil|  fil.join(' - ') }.join("\n")
  File.write($bd_name, newTasks)
end

def write
  list_task = read_file
  new_task = [4.to_s, @options]
  list_task << new_task
  p list_task
end

def delete
end



def show
  puts File.read("./file.txt")
end

puts ARGV.inspect

@options = ARGV.join(" ") 

if @options == ""
  puts "Listando"
  
elsif @options.include?("-d")
  id = ARGV[1]
  puts "borrando task #{id}" 
else
  task = @options
  puts "agregando #{task}"
end

# @options with case

p read_file
write
