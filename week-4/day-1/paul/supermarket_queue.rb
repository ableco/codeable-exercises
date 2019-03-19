def queue_time(customers, n)
  tills = Array.new(n, 0)
  time = 0
  while customers.count > 0 do
    if tills.index(0)
      tills[tills.index(0)] = customers.shift
    else
      time = time + tills.min
      tills.index(tills.min) = 0
    end
  end

end