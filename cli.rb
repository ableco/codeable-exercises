def read
end

def write
end

def delete
end

puts ARGV.inspect

options = ARGV.join(" ") 

if options == ""
  puts "Listando"
elsif options.include?("-d")
  id = ARGV[1]
  puts "borrando task #{id}" 
else
  task = options
  puts "agregando #{task}"
end

# options with case
