spoken    =->(greeting) { greeting.capitalize + '.' } #=> "Hello."
shouted   =->(greeting) { greeting.upcase + '!' } #=> "HELLO!"
whispered =->(greeting) { greeting.downcase + '.'} #=> "hello."


greet =->(style, msg) { style.call(msg) }

puts greet.("shouted", "holi")
