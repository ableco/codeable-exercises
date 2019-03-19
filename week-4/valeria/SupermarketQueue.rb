#https://www.codewars.com/kata/the-supermarket-queue/train/ruby

def queue_time(customers, n)
    tills = Array.new(n, 0)
    customers.each {|c| tills[tills.index(tills.min)] += c }
    tills.max
end

# puts queue_time([], 1)#, 0 
# puts queue_time([5], 1)#, 5 
# puts queue_time([2], 5)#, 2
# puts queue_time([1,2,3,4,5], 1)#, 15
# puts queue_time([1,2,3,4,5], 100)#, 5
# puts queue_time([2,2,3,3,4,4], 2)#, 9