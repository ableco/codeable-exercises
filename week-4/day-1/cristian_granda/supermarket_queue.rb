def queue_time(customers, n)
  arr = Array.new(n, 0)
  customers.each do |customer|
    arr[arr.index(arr.min)] += customer
  end
  arr.max
end