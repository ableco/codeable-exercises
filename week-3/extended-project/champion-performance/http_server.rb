require 'socket'
require 'uri'
require './controller/controller'

WEB_ROOT = './public'

def requested_file(request_line, socket)
  #Obtenemos la direccion en consulta
  request_uri  = request_line.split(" ")[1]
  #Mostramos en consola la direccion en consulta
  puts "petition to : #{request_uri}"

  #Validamos
  case request_uri
  when /^(\/)$/

    puts "first option"
    response_from_path(WEB_ROOT, socket)

  when /^(\/\w+\.\w+)$/

    puts "second option"
    path   = URI.unescape(URI(request_uri).path)

    clean = []
    parts = path.split("/")

    parts.each do |part|
      next if part.empty? || part == '.'
      part == '..' ? clean.pop : clean << part
    end

    path = File.join(WEB_ROOT, *clean)
    response_from_path(path, socket)

  when /^(\/\?name=\w+)$/
    puts "third option"

    paramstring = request_uri.split('?')[1]
    name = paramstring.split('=')[1]

    response_from_string(controller(name), socket)

  else
      print "something else"
  end

end

def response_from_string(file, socket)

  socket.print "HTTP/1.1 200 OK\r\n" +
  "Content-Type: text/html\r\n" +
  "Content-Length: #{file.size}\r\n" +
  "Connection: close\r\n"

  socket.print "\r\n"
  socket.print file

  #IO.copy_stream(file, socket)
end

def response_path_exist(file,socket)
  socket.print "HTTP/1.1 200 OK\r\n" +
                       "Content-Type: text/html\r\n" +
                       "Content-Length: #{file.size}\r\n" +
                       "Connection: close\r\n"
  socket.print "\r\n" 
end


def response_from_path(path, socket)
  path = File.join(path, 'index.html') if File.directory?(path)

  if File.exist?(path) && !File.directory?(path)
    File.open(path, "rb") do |file|
      response_path_exist(file,socket)
      IO.copy_stream(file, socket)
      end
  else
    message = "File not found\n"

    socket.print "HTTP/1.1 404 Not Found\r\n" +
                 "Content-Type: text/plain\r\n" +
                 "Content-Length: #{message.size}\r\n" +
                 "Connection: close\r\n"

    socket.print "\r\n"

    socket.print message
  end
end


server = TCPServer.new('localhost', 2345)
loop do
  socket = server.accept
  request_line = socket.gets
  puts request_line
  requested_file(request_line, socket)
  socket.close
end

