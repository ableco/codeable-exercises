require 'colorize'

$task_array = []
$id= 1

def add(choice)
  task = choice[4..-1] # chop the 'new' command off and get just task text
  if task.nil? == true
    puts "Tarea vacia"
  else
    $todolist.push(task)
  end
end

def add(str)
  task = str[4..-1] # Se come el new
  if task.nil? == true
    puts "Tarea vacia"
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
    exit(0)
  when "q"
    exit(0)
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
  1.times {puts ""}
  puts "Type: 't title of task' to add a new todo list item."
  puts "Type: 't' to show your task list."
  puts "Type: 't -d [task number]'' to complete a task, or 'complete all' to clear."
  puts "Type: 'quit' or 'q' to quit. This will save your tasks for next time."
  puts "Type: 'help' for a full list of commands"
  puts ""
  show
  menu
  end

rescue Interrupt => e
  quit # forces the file to save even if the user [ctrl+c]s out
end
