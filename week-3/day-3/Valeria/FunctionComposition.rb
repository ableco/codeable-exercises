#https://www.codewars.com/kata/function-composition/train/ruby

def compose(f,g)
    lambda = ->(*args) { f.call(g.call(*args)) }
end

add1 = ->(a){a + 1}
id   = ->(a){a}

puts compose(add1,id).(0)}
