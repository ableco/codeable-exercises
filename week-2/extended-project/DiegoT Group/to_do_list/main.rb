require_relative "to_do_list"

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