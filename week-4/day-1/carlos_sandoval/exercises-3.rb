def queue_time(customers,n)
    queue = Array.new(n,0)
    while customers.length > 0
     queue[0] += customers.shift 
     queue.sort! 
    end
    queue.max
    end
    