def compose(f,g)
    lambda { |*args| f.call(g.call(*args)) } 
   end