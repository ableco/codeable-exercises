require 'colorize'

$task_array = []
$id= 1

def add(choice)
  puts choice
  task = choice[4..-1] # chop the 'new' command off and get just task text
  if task.nil? == true
    puts "Empty task"
  else
    $todolist.push(task)
  end
end

def add(str)
  task = str[4..-1] # Se come el new
  if task.nil? == true
    puts "Empty task"
  else
    ad = {id: $id, name: task}
    $task_array.push(ad)
    $id += 1
  end
end

def delete(choice)
  id = choice[7..-1].to_i #se come el delete
  $task_array.delete_if { |hash| (hash[:id] == id) }
  show
end

def show()
  $task_array.each do |task|
	puts "#{task[:id]}. #{task[:name]}"
	end
end

def quit
  exit(0)
end

#Refactoring menu
def menu
  print "> "
  choice = gets.chomp
  case choice
  when /(new)/
    add(choice)
  when /(delete)/
    delete(choice)
  when "show"
    show
  when "quit"
    quit
  else
    puts ""
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
  print logo
  2.times {puts ""}
  puts "Tipea: 't title of task' to add a new todo list item.".red
  puts "Tipea: 't' to show your task list."
  puts "Tipea: 't -d [task number]'' to complete a task, or 'complete all' to clear."
  puts "Tipea: 'quit' to quit. This will save your tasks for next time."
  puts "Tipea: 'help' for a full list of commands"
  puts ""
  show
  menu
  end

rescue Interrupt => e
  quit # forces the file to save even if the user [ctrl+c]s out
end