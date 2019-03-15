require "erb"
require "socket"

#HTML Templates
#*********************************************************************************
home = '
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <title>WELCOME!!</title>
          </head>
          <body>
            <h1>Welcome to the Codeable website!</h1>
            <h2>This is our team:</h2>
            <ul>
              <li><a href="/?member=diegoc">Diego Cuevas</a></li>
              <li><a href="/?member=angie">Angie Gonzales</a></li>
              <li><a href="/?member=marieth">Marieth Pérez</a></li>
              <li><a href="/?member=diegot">Diego Torres</a></li>
              <li><a href="/?member=valeria">Valeria Vassallo</a></li>
            </ul>
          </body>
        </html>
        '
userguide = '
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <title>INFO</title>
          </head>
          <body>
            <h1>Mi nombre es <%= name %></h1>
            <h2>Pregunta 1:</h2>
            <p><%= r1 %></p>
          </body>
        </html>
        '
user_error = '
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <title>INFO</title>
          </head>
          <body>
            <h1>Nombre no encontrado</h1>
          </body>
        </html>
        '
path_error = '
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <title>INFO</title>
          </head>
          <body>
            <h1>Ruta no encontrada</h1>
          </body>
        </html>
        '
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
    html = ERB.new(home).result(binding)
  elsif path.match(/\/\?member\=/)
    member = path.split("=")[1]
    data.each do |hash|
      if hash[:member] == member
        name = hash[:name]
        r1 = hash[:r1]
        html = ERB.new(userguide).result(binding)
        break
      else
        html = ERB.new(user_error).result(binding)
      end
    end
  else
    html = ERB.new(path_error).result(binding)
  end

  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3
  session.print html
  session.close
end