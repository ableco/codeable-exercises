# define global variable
$bd_name = File.expand_path('../', __FILE__) + '/bd.txt' 
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

def delete(id)
  list_task = read_file
  new_tasks = list_task.select { |task| task[0] != id }
  if new_tasks == list_task
    puts "No existe tarea"  
    return "No existe tarea"
  end
  puts "Borrando task #{id}"
  save_file(new_tasks)
  show
end

def show
  return File.read($bd_name).split("\n")
end
