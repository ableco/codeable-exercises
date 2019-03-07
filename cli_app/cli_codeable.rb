require 'colorize'

$task_array = []
$id= 1


def add(choice)
<<<<<<< HEAD
  puts choice
  task = choice[4..-1] # chop the 'new' command off and get just task text
  if task.nil? == true
    puts "Empty task"
  else
    $todolist.push(task)
  end
end
=======
>>>>>>> 071b2b3df225ba292ad63126dbbeea5f50bb7466

  task_name = choice[2..-1] # Se come el new
  puts task.inspect
  if task_name.empty? == true
    puts "Tarea Vacia"

  else
    task_hash = {id: $id, name: task}
    $task_array.push(task_hash)
    $id += 1
  end
end

def delete(choice)
  id = choice[5..-1].to_i #se come el delete
  $task_array.delete_if { |hash| (hash[:id] == id) }
  show
end

def show
  $task_array.each do |task|    
    indent = (3 - task[:id].to_s.length) 
    indent = 0 if indent < 0
    puts "#{task[:id]}-".green + " "*indent + "#{task[:task_name]}"
	end
end

#Refactoring menu
def menu
  print "> "
  choice = gets.chomp
  case choice
  when /(t\s\-d)/
    delete(choice)
  when /(t\s)/
    add(choice)
  when "show"
    show
  when "quit"
    exit(0)
  when "q"
    exit(0)
  else
    puts "Error: unexpected input"
  end
  menu
end

begin
  while true == true
    logo ="
    ____          _            _     _      
   / ___|___   __| | ___  __ _| |__ | | ___ 
  | |   / _ \\ / _` |/ _ \\/ _` | '_ \\| |/ _ \\
  | |__| (_) | (_| |  __/ (_| | |_) | |  __/
   \\____\\___/ \\__,_|\\___|\\__,_|_.__/|_|\\___|
                                          
    \n ".blue
  2.times {puts ""}

  puts "Type: 't title of task' to add a new todo list item.".red
  puts "Type: 't' to show your task list."
  puts "Type: 't -d [task number]'' to complete a task, or 'complete all' to clear."
  puts "Type: 'quit' or 'q' to quit. This will save your tasks for next time."

  puts ""
  show
  menu
  end

rescue Interrupt => e
  quit # forces the file to save even if the user [ctrl+c]s out
end
