# define global variable
$bd_name = "bd.txt"

def read_file
  File.read($bd_name).split("\n").map { |line| line.split(" - ").map(&:strip) }
end

def save_file(tasks)
  newTasks = tasks.map { |fil|  fil.join(' - ') }.join("\n")
  File.write($bd_name, newTasks)
end

def write(task)
  list_task = read_file
  last_index = (list_task[list_task.length - 1][0]).to_i
  new_task = [(last_index + 1).to_s, task]
  list_task << new_task
  save_file(list_task)
  show
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
  write(options)
end
