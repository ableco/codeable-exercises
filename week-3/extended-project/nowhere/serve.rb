require 'socket'
require "erb"
require_relative 'routes.rb'

port = 3000
server = TCPServer.new port

puts "Running server 🚀  in http://localhost:#{port}"

loop do
  session = server.accept
  request = []
  while (line = session.gets) && (line.chomp.length > 0)
    request << line.chomp
  end

  puts "finished reading"

  http_method, path, protocol = request[0].split(' ')

  if PAGES.keys.include? path
    status = "200 OK"
    template = File.read('views/' + PAGES[path])
    response_body = ERB.new(template).result(binding)
  else
    status = "404 Not Found"
    response_body = PAGE_NOT_FOUND
  end

  session.puts """
  HTTP/1.1 #{status}

  #{response_body}
  """

  session.close
end
