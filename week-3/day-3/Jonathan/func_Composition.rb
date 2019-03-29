def compose(f,g)
  ->(*args){ f.( g.(*args) ) }
end