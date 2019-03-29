spoken    =->(greeting) {greeting.capitalize + "."}
shouted   =->(greeting) {greeting.upcase + "!" }
whispered =->(greeting) {greeting.downcase + "." }

greet =->(style, msg) { style.call(msg) }