@list 
def read_file
  File.read("bd.txt").split("\n").map { |line| line.split("-").map(&:strip) }
end


def write
  list_task = read_file
  new_task = [4.to_s, @options]
  list_task << new_task
  p list_task
end

def delete
end



def show
  puts File.read("./file.txt")
end

puts ARGV.inspect

@options = ARGV.join(" ") 

if @options == ""
  puts "Listando"
  
elsif @options.include?("-d")
  id = ARGV[1]
  puts "borrando task #{id}" 
else
  task = @options
  puts "agregando #{task}"
end

# @options with case

p read_file
write