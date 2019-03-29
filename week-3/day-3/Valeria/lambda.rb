#https://www.codewars.com/kata/lambdas-as-a-mechanism-for-open-slash-closed/train/ruby

spoken    =->(greeting) { greeting + "." }
shouted   =->(greeting) { greeting.upcase + "!" }
whispered =->(greeting) { greeting.downcase + "." }

greet =->(style, msg) { style.call(msg) }

puts greet.(spoken, "Hello")
puts greet.(shouted, "Hello")
puts greet.(whispered, "Hello")