def compose(f,g)
  lambda {|*args| f.call(g.call(*args))}
end

compose(add1,id).(0) 