require './cli_codeable.rb'

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