


def self.queue_time(customers, lines)
  tills = Array.new(lines, 0)

  customers.each do |c|
    min = tills.min
    i = tills.index{|val| val == min } 
    tills[i] += c
  end

  tills.max
end