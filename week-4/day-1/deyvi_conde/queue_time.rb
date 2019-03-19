def queue_time(customers, n)
reg = Array.new(n,0)
while customers.length > 0
 reg[0] += customers.shift 
 reg.sort! 
end
reg.max
end
