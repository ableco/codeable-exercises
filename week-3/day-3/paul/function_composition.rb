def compose(f,g)
  lambda = -> (*args) { f.(g.(*args))}
end