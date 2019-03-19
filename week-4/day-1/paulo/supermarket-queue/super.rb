def queue_time(customers, n)
  if n == 1
    return customers.sum 
  else
    box = Array.new(n, 0)
    customers.each do |item|
      box[0] += item
      box.sort!
    end
    box.last
  end
end