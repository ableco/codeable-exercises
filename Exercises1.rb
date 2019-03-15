def compose(f,g)
  -> (*arg) { f.call(g.call(*arg))  }
end