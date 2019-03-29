#OUR SOLUTION!
spoken    =->(greeting) { "#{greeting}." }
shouted   =->(greeting) { "#{greeting.upcase}!" }
whispered =->(greeting) { "#{greeting.downcase}." }

greet =->(style, msg) {style.(msg)} 


#OTHERS SOLUTION!
# spoken    = ->(msg) { msg.capitalize + '.' }
# shouted   = ->(msg) { msg.upcase + '!'}
# whispered = ->(msg) { msg.downcase + '.' }

# greet =->(style, msg) { style.(msg) }

# spoken    =->(greeting) { greeting.capitalize + '.' } #=> "Hello."
# shouted   =->(greeting) { greeting.upcase + '!' } #=> "HELLO!"
# whispered =->(greeting) { greeting.downcase + '.'} #=> "hello."

# greet =->(style, msg) { style.call(msg) }

# spoken = lambda { |i| i.capitalize + '.' }
# shouted = lambda { |i| i.upcase + "!" }
# whispered = lambda { |i| i.downcase + '.' }


# greet = lambda { |lamb, msg| lamb.call(msg) }

# spoken = lambda {|greeting| return "#{greeting}."}
# shouted = lambda {|greeting| return "#{greeting.upcase}!"}
# whispered = lambda {|greeting| return "#{greeting.downcase}."}

# greet = lambda {|style, msg| 
#   return style.(msg)
#     }

# spoken = lambda { |x| x << "." }
# shouted = lambda { |x| x.upcase << "!" }
# whispered = lambda { |x| x.downcase << "." }
# greet = lambda { |x,y| x.(y) }