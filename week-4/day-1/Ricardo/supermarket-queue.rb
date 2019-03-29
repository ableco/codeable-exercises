def queue_time(customers, n)
  return 0 if n == 0 || customers == 0
  cashiers = Array.new(n,0)
  
  customers.each do |customer|
    index_of_min = cashiers.each_with_index.min.last
    cashiers[index_of_min] += customer
  end
  
  cashiers.max
  
end

puts queue_time([2,2,3,3,4,4], 2)