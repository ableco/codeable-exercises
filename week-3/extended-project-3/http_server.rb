require "erb"
require "socket"

#USER DATA
#*********************************************************************************
data = [
  {
    :member => "diegot",
    :name => "Diego Torres",
    :answer1 => "I'm very practical.",
    :answer2 => "Unconsidered people.",
    :answer3 => "Be honest and shows a genuine interest in helping others.",
    :answer4 => "Although my intentions are good, sometimes I can be very cold and direct.",
    :answer5 => "Show me the logic and the facts that support it.",
    :answer6 => "And honest face to face conversation."
  },  
  {
    :member => "angie",
    :name => "Angie Gonzales",
    :answer1 => "I can spend too much time staring the moon",
    :answer2 => "News about sexual harassment towards children",
    :answer3 => "if they smile to me, are nice and honest",
    :answer4 => "I am flirty and it is not like that, I am just a kind and expressive person",
    :answer5 => "Showing me facts and making this information connect with me in an emotional way",
    :answer6 => "In private,and face-to-face."
  },  
  { 
    :member => "marieth",
    :name => "Marieth Perez",
    :answer1 => "I like sleeping, my family members say that I always sleep happy, smiling.",
    :answer2 => "I don't like heights, for example being on a very high bridge. I don't like that people don't stay true to their word.",
    :answer3 => "When people help poor children on the street.",
    :answer4 => "That I am bothered by something when in reality I am not.",
    :answer5 => "When people tell me the exact purpose of what they want me to do",
    :answer6 => "I would like feedbacks to be in a constructive way."
  },  
  { 
    :member => "diegoc",
    :name => "Diego Cuevas",
    :answer1 => " I'm immature.",
    :answer2 => "A person who talks as if they knew absolutely everything.",
    :answer3 => "They gotta be funny.",
    :answer4 => "People think that I'm careless, but l actually do care.",
    :answer5 => "Tell me it's good for me and there are no risks.",
    :answer6 => "Face-to-face. As straightforward as possible.",
  },  
  {
    :member => "valeria",
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
    html = ERB.new(File.read("home.erb")).result(binding)
  elsif path.match(/\/\?member\=/)
    member = path.split("=")[1]
    data.each do |hash|
      if hash[:member] == member
        name = hash[:name]
<<<<<<< HEAD
        r1 = hash[:r1]
=======
        answer1 = hash[:answer1]
        answer2 = hash[:answer2]
        answer3 = hash[:answer3]
        answer4 = hash[:answer4]
        answer5 = hash[:answer5]
        answer6 = hash[:answer6]
>>>>>>> 9a39b0ab473e1ea01f8a55f47d977e0a2df85edc
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
