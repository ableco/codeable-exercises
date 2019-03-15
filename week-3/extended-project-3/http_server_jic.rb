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
data = [
    {
      :member => "diegoc"
      :name => "Diego Cuevas",
      :answer1 => "a1",
      :answer2 => "a2",
      :answer3 => "a3",
      :answer4 => "a4",
      :answer5 => "a5",
    },  
    {
      :member => "angie"
      :name => "Angie Gonzales",
      :answer1 => "I can spend too much time staring the moon",
      :answer2 => "News about sexual harassment towards children",
      :answer3 => "if they smile to me, are nice and honest",
      :answer4 => "I am flirty and it is not like that, I am just a kind and expressive person",
      :answer5 => "Showing me facts and making this information connect with me in an emotional way",
      :answer6 => "In private,and face-to-face."
    },  
    { 
      :member => "marieth"  
      :name => "Marieth Perez",
      :answer1 => "a1",
      :answer2 => "a2",
      :answer3 => "a3",
      :answer4 => "a4",
      :answer5 => "a5",
      :answer6 => "a6"
    },  
    { 
      :member => "diegot"
      :name => "Diego Torres",
      :answer1 => " I'm immature.",
      :answer2 => "A person who talks as if they knew absolutely everything.",
      :answer3 => "They gotta be funny.",
      :answer4 => "People think that I'm careless, but l actually do care.",
      :answer5 => "Tell me it's good for me and there are no risks.",
      :answer6 => "Face-to-face. As straightforward as possible.",
    },  
    {
      :member => "valeria"  
      :name => "Valeria Vassallo",
      :answer1 => "I worry too much. I really pay attention to the details, so be careful!",
      :answer2 => "When people make some noises that bother me (e.g. screeching)",
      :answer3 => "Be honest. Be friendly. Don't be selfish nor arrogant.",
      :answer4 => "I swear I'm not mad at you! My personality and my face are just like that!",
      :answer5 => "Give me facts",
      :answer6 => "Definitely not face to face. I mean... I can deal with it, yes, but I still feel kind of uncomfortable. I'll get better at it, I promise!",
    }
   ]

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