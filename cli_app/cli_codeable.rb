require 'colorize'

$task_array = []
$id= 1

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
def all()
$task_array.clear
end

def delete(choice)
  id = choice[7..-1].to_i #se come el delete
  $task_array.delete_if { |hash| (hash[:id] == id) }
  puts "se elimino la #{id} tarea"
end

def show()
  $task_array.each do |task|
	puts "#{task[:id]}. #{task[:name]}"
	end
end

def q
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
  when "q"
    q
  when "all"
    all
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
  puts logo
  puts "Menu ---"
  puts "new---para agregar tu tarea"
  puts "show_all---para mostrar todas las tareas"
  puts "delete---para eliminar"
  puts "all---para eliminar todo"
  puts "q---para salir del programa"
  show
  menu
  all
  end

rescue Interrupt => e
  q # forces the file to save even if the user [ctrl+c]s out
end