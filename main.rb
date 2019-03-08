#!/usr/bin/env ruby
require_relative 'cli'

options = ARGV.join(" ") 

if options == ""
  puts "Listando"
  puts show
  
elsif options.include?("-d")
  id = ARGV[1]
  delete(id)
  puts show
else
  task = options
  puts "Agregando #{task}"
  write(options)
  puts show
end
