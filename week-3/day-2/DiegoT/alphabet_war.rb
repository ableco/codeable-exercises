def alphabet_war(fight)
    left_chars = ["s","b","p","w"]
    right_chars = ["z","d","q","m"]
    left, right = 0, 0
    fight.each_char do |char|
        left += (left_chars.index(char) + 1) if left_chars.include?(char)
        right += (right_chars.index(char) + 1) if right_chars.include?(char)
    end

    if left > right
        "Left side wins!"
    elsif right > left
        "Right side wins!"
    else
        "Let's fight again!"
    end
end

puts alphabet_war("z") #"Right side wins!"
puts alphabet_war("zdqmwpbs") #"Let's fight again!"
puts alphabet_war("wq") #"Left side wins!"
puts alphabet_war("zzzzs") #"Right side wins!"
puts alphabet_war("wwwwww") #"Left side wins!"