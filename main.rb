#!/usr/bin/env ruby
require_relative 'cli'

options = ARGV.join(" ") 

if options == ""
  puts "Listando"
  puts show
  
elsif options.include?("-d")
  id = ARGV[1]
  delete(id)
else
  task = options
  puts "Agregando #{task}"
  write(options)
end
