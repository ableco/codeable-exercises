spoken    =->(greeting) { greeting +"."}
shouted   =->(greeting) { greeting.upcase + "!"}
whispered =->(greeting) { greeting.downcase + "."}

greet =->(style, msg) { 
  style.(msg)
}

puts greet.(spoken, "Hello")
puts greet.(shouted, "Hello")
puts greet.(whispered, "Hello")