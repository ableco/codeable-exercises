require_relative "to_do_class"

def operation(user_input, task_list)
  #LIAN y DIEGO
  #Ejecuta acción según el input del usuario

  if !!(user_input =~ /^t$/) 
    task_list.list.each {|task| puts task}
  elsif !!(user_input =~ /^t\s[^-]+/)
    user_input[0..1] = ""
    task_list.add(user_input)
  elsif !!(user_input =~ /^t\s-d\s\d+$/)
    user_input[0..4] = ""
    task_list.delete(user_input.to_i)
  elsif !!(user_input =~ /^q$/)
    puts 'Gracias por usar To Do List "Venganza"'
    exit
  else
    puts "Error: Unexpected input"
  end
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