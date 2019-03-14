def compose(f,g)
    # Compose the two functions here!
    lambda { |x| f.call(g.call(x)) }
end

add1 = ->(a){a + 1}
id   = ->(a){a}

puts compose(add1,id).(2)