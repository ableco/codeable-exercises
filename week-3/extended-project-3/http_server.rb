require "erb"
require "socket"

#USER DATA
#*********************************************************************************
data = [{:member => "diegoc", :name => "Diego Cuevas", :r1 => "Hola"},
        {:member => "diegot", :name => "Diego Torres", :r1 => "Hola 2"}]

#SERVER
#*********************************************************************************
server = TCPServer.new 5678
while session = server.accept
  request = []
  while (line = session.gets) && (line.chomp.length > 0)
    request << line.chomp
  end
  puts request[0]
  http_method, path, protocol = request[0].split(' ')
  html=""

  if path == "/"
    html = ERB.new(File.read("home.erb")).result(binding)
  elsif path.match(/\/\?member\=/)
    member = path.split("=")[1]
    data.each do |hash|
      if hash[:member] == member
        name = hash[:name]
        r1 = hash[:r1]
        html = ERB.new(File.read("userguide.erb")).result(binding)
        break
      else
        html = ERB.new(File.read("user_error.erb")).result(binding)
      end
    end
  else
    html = ERB.new(File.read("path_error.erb")).result(binding)
  end

  session.print "HTTP/1.1 200\n" # 1
  session.print "Content-Type: text/html\n" # 2
  session.print "\n" # 3
  session.print html
  session.close
end