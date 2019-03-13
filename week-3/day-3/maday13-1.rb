# OUR SOLUTION!

def compose(f,g)
    ->(*args){ f.( g.(*args) ) }
end


#OUR OTHER SOLUTION

# def compose(f,g)
#     lambda { |*args| f.call(g.call(*args)) }
# end
  
  


# Other solutions 
    # def compose(f,g)
    #     ->(*args) { f.call(*g.call(*args)) }
    # end

    # def compose(a,b)
    #     lambda {|*args| a[b[*args]]}
    # end

    # def compose(f,g)
    #     return ->(*a){f.call(g.call(*a))}
    # end

    # def compose(f,g)
    #     lambda {|*arg| f.(g.(*arg))}
    # end