# define global variable
$bd_name = "bd.txt"

def read_file
  File.read($bd_name).split("\n").map { |line| line.split(" - ").map(&:strip) }
end

def save_file(tasks)
  newTasks = tasks.map { |fil|  fil.join(' - ') }.join("\n")
  File.write($bd_name, newTasks)
end

def write
end

def delete
end



def show
  puts File.read($bd_name).split("\n")
end

# puts ARGV.inspect

options = ARGV.join(" ") 

if options == ""
  # puts "Listando"
  show
elsif options.include?("-d")
  id = ARGV[1]
  puts "borrando task #{id}" 
else
  task = options
  puts "agregando #{task}"
end

