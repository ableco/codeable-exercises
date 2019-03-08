require 'colorize'

$task_array = []
$id= 1

def add(choice)

  task_name = choice[2..-1] # Se come el new
  if task_name.empty? == true
    puts "Empty task"

  else
    task_hash = {id: $id, task_name: task_name}
    $task_array.push(task_hash)
    $id += 1
  end
end

def all()
  $task_array.clear
  puts "All list was clear"
end

def delete(choice)
  id = choice[5..-1].to_i #se come el delete
  number_tasks_before = $task_array.length
  $task_array.delete_if { |hash| (hash[:id] == id) }
  number_tasks_after = $task_array.length

  if number_tasks_after == number_tasks_before
    puts "Task ID doesn't exist"
  else
    puts "Task #{id} was deleted".yellow
    show
  end
  
end

def show
  if $task_array.empty? 
    return puts "There are not tasks".green
  end
  $task_array.each do |task|    
    indent = (3 - task[:id].to_s.length) 
    indent = 0 if indent < 0
    puts "#{task[:id]}-".green + " "*indent + "#{task[:task_name]}"
	end
end

#Refactoring menu
def menu
  print "> ".cyan
  choice = gets.chomp
  case choice
  when /^(t\s\-d\s.)/
    delete(choice)
  when /(t\s\-)/
    puts "Error: unexpected input".red
  when /(t\s)/
    add(choice)
  when "t"
    show
  when "quit"
    exit(0)
  when "q"
    exit(0)
  when "all"
    all
  else
    puts "Error: unexpected input".red
  end
  menu
end

begin
  while true == true
  puts logo ="
    ____          _            _     _      
   / ___|___   __| | ___  __ _| |__ | | ___ 
  | |   / _ \\ / _` |/ _ \\/ _` | '_ \\| |/ _ \\
  | |__| (_) | (_| |  __/ (_| | |_) | |  __/
   \\____\\___/ \\__,_|\\___|\\__,_|_.__/|_|\\___|                                  
  ".blue
  1.times {puts ""}

  puts "Type: 't title of task' to add a new todo list item.".cyan
  puts "Type: 't' to show your task list.".cyan
  puts "Type: 't -d [task number]' to complete a task and clean.".cyan
  puts "Type: 'quit' or 'q' to quit.".cyan

  puts ""
  show
  menu
  all
  end

rescue Interrupt => e
  quit # forces the file to save even if the user [ctrl+c]s out
end
