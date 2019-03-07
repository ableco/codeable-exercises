require_relative "to_do_class"

def operation(user_input, task_list)
  #LIAN y DIEGO
  #Ejecuta acción según el input del usuario
end

def instructions
  puts "***************************************************************"
  puts 'Bienvenido al gran To Do List "Venganza"'
  puts "***************************************************************"
  puts "Para listar tus tareas digita: t"
  puts "Para agregar una nueva tarea digita: t [tarea]"
  puts "Para eliminar una tarea digita: t -d [numero de tarea]"
  puts "Para salir del To Do List digita: q"
  puts "***************************************************************"
end

system 'clear'
instructions
puts "Lista, agrega o elimina tus tareas a continuación:"
to_do = ToDo.new()

while true
  input = gets.chomp
  system 'clear'
  instructions
  operation(input,to_do)
  puts "Lista, agrega o elimina tus tareas a continuación:"
end