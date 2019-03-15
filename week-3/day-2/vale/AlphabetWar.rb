def alphabet_war(fight)
    @left_side = {
        w: 4,
        p: 3,
        b: 2,
        s: 1
    }
    @right_side = {
        m: 4,
        q: 3,
        d: 2,
        z: 1
    }
    winner(fight)
end

def leftie(fight)
    splitted = fight.split("")
    left = splitted.map { |x| @left_side[x.to_sym] }
    left.compact!
    left_sum = left.sum
end 

def rightie(fight)
    splitted = fight.split("")
    right = splitted.map { |x| @right_side[x.to_sym] }
    right.compact!
    right_sum = right.sum
end 

def winner(fight)  
    if leftie(fight) < rightie(fight)
    return "Right side wins!"
    elsif rightie(fight) < leftie(fight)
    return "Left side wins!"
    else
    return "Let's fight again!"
    end
end

puts alphabet_war("zdqmmmmmmmwpbs")