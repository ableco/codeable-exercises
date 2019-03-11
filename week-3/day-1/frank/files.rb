#   
# Execute this file => ruby files.rb data.json some_word

require "json"
require 'terminal-table'

# begin
  path_json = ARGV.first
  word = ARGV.last
  resp = "yes"
  
  unless File.exists?(path_json)
    puts "Do you want create the file? yes|no"
    resp = STDIN.gets.chomp
  end
  
  exit if resp == "no"
  
  content = File.read(path_json)
  hash = JSON.parse(content)
  hash["words"].unshift word
  
  File.write(path_json, hash.to_json)
  rows = hash["words"].map{|word| [word]}
  table = Terminal::Table.new :headings => ['Words'], :rows => rows

  puts table
  
# rescue Exception
#   puts "There was an error, try again :)"
# end

