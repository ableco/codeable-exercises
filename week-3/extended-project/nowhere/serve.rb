require 'socket'
require "erb"
require_relative 'routes.rb'
require_relative 'members.rb'

port = 3000
server = TCPServer.new port

puts "Running server 🚀  in http://localhost:#{port}"

loop do
  session = server.accept
  request = []
  while (line = session.gets) && (line.chomp.length > 0)
    request << line.chomp
  end

  puts request[0]

  http_method, path, protocol = request[0].split(' ')

  puts path

  content = 'text/html'
  status = "200 OK"

  if PAGES.keys.include? path
    template = File.read('views/' + PAGES[path])
  elsif path.match(/.css/)
    template = File.read('public' + path)
    content = 'text/css'
  elsif path.match(/.js/)
    template = File.read('public' + path)
    content = 'text/js'
  else
    status = "404 Not Found"
    template = File.read('views/' + PAGE_NOT_FOUND)
  end

  response_body = ERB.new(template).result(binding)

  session.puts """
  HTTP/1.1 #{status}
  Content-Type: #{content}

  #{response_body}
  """

  session.close
end
