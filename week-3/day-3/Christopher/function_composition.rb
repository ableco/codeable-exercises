# def compose(f,g)
#     h=->(*args){ f.(g.(*args))}
# end

def compose(f, g)
    lambda { |*args| f.call(g.call(*args)) }
  end

add1 =->(a){a + 1}
id   =->(a){a}

puts compose(add1,id).(0)