require_relative "to_do_class"

def operation(user_input, task_list)
  #LIAN y DIEGO
  #Ejecuta acción según el input del usuario

  if !!(user_input =~ /^t$/) 
    resp = task_list.list
    imprimir(resp)
  elsif !!(user_input =~ /^t\s[^-|\s]+/)
    user_input[0..1] = ""
    task_list.add(user_input)
  elsif !!(user_input =~ /^t\s-d\s\d+$/)
    user_input[0..4] = ""
    resp = task_list.delete(user_input.to_i)
    if resp.class == String
      puts resp
    else
      imprimir(resp)
    end
  elsif !!(user_input =~ /^q$/)
    puts 'Gracias por usar To Do List "Venganza"'
    exit
  else
    puts "Error: Unexpected input"
    return "Error: Unexpected input"
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

def imprimir(array)
  if array == []
    puts "[Lista vacia] \n ¿Te llevas bien con todos?"
  else
    puts "Esta es tu lista de venganza \n =============================="
    array.each {|task| puts task}
  end
end