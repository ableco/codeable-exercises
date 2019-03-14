def compose(f,g)
  l = ->(*args) { f.call(g.call(*args)) }
end

add1 = ->(a){a + 1}
id   = ->(a){a}

puts compose(add1,id).(5)