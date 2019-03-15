# http_server.rb
require 'socket'
require "erb"
server = TCPServer.new 5678 
name = "Diego" 
html = '
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
html = ERB.new(html).result(binding)while session = server.accept
 request = session.gets
 puts request.split(" ")[1]
 
 name = /\/\?member\=/  session.print "HTTP/1.1 200\r\n" # 1
 session.print "Content-Type: text/html\r\n" # 2  session.print "\r\n" # 3  session.print html  session.close
end