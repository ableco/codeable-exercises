spoken    =->(greeting) { "#{greeting.capitalize}." }
shouted   =->(greeting) { "#{greeting.upcase}!" }
whispered =->(greeting) { "#{greeting.downcase}." }

greet =->(style, msg) { style.(msg)}


puts greet.(spoken, "Hello") # "Hello."
puts greet.(shouted, "Hello") # "HELLO!"
puts greet.(whispered, "Hello") # "hello."