spoken    =->(greeting) {greeting.capitalize + "." }
shouted   =->(greeting) {greeting.upcase + "!"}
whispered =->(greeting) {greeting.downcase + "."}

greet =->(fun, msg) { fun.call(msg) }