# define global variable
$bd_name = "bd.txt"


def read_file
  File.read($bd_name).split("\n").map { |line| line.split("-").map(&:strip) }
end

def save_file(tasks)
  newTasks = tasks.map { |fil|  fil.join(' - ') }.join("\n")
  File.write($bd_name, newTasks)
end

def write
end

def delete(id)
 
  list_task=read_file
  i=0
  list_task.each do |elemento| 
    if elemento[0].include?(id.to_s)
      if id.to_s==elemento[0]  

        list_task.delete_at(i) 
      end  
    else
      puts "No existe tarea"  
    end
    i+=1
  end

  save_file(list_task)
  show
end



def show
  puts File.read("./bd.txt")
end

puts ARGV.inspect

options = ARGV.join(" ") 

if options == ""
  puts "Listando"
  puts read_file.inspect
  
elsif options.include?("-d")
  id = ARGV[1]
  puts "borrando task #{id}" 
  delete(id)
  puts read_file.inspect
  puts id

else
  task = options
  puts "agregando #{task}"
end
