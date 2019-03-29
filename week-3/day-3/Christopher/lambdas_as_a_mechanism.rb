
spoken =->(greeting){
    a=greeting.capitalize
     puts "#{a}."
}

shouted =->(greeting){
    a=greeting.upcase
    puts "#{a}!"
}

whispered =->(greeting){
    a=greeting.downcase
    puts "#{a}"
}
 #----------------------------------------------------
greet =->(style, msg){
    style.(msg)
}

greet.(shouted,"holaaaa")
