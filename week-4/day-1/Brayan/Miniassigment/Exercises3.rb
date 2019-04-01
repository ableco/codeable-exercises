def queue_time(customers, n)
  number_tills = Array.new(n, 0)
  customers.each do |time|
    index = number_tills.index(number_tills.min)
    number_tills[index] += time
  end
  number_tills.max
end