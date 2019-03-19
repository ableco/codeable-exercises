def queue_time(customers, n)
  return 0 if customers.empty?
  return customers.sum if n == 1
  return customers.max if n > customers.length

  arrQueue = Array.new(n, 0)
  
  customers.each do |item|
    arrQueue[0] += item
    arrQueue.sort!
  end
  
  arrQueue.last
end

puts queue_time([2, 2, 3, 3, 4, 4], 2) # 9
puts queue_time([1,2,3,4,5], 100) # 5
