def queue_time(customers, n)
  checkout = Array.new(n, 0)

  if customers.empty?
    return 0
  else
    customers.each do |x|
      checkout[0] = checkout[0] + x
      checkout.sort!
    end
    checkout.last
  end
end

puts queue_time([], 1) # 0
puts queue_time([5], 1) # 5
puts queue_time([2], 5) # 2
puts queue_time([1,2,3,4,5], 1) # 15
puts queue_time([1,2,3,4,5], 100) # 5
puts queue_time([2,2,3,3,4,4], 2) # 9