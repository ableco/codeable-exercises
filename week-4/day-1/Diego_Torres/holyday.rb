class HolidayPriorityQueue
  def initialize
    @queue = []
  end
  
  def addGift gift
    @queue << gift
    @queue.length
  end
  
  def buyGift
    return "" if @queue.length == 0
    @max = @queue[0]["priority"]
    @max_index = -1

    @queue.each_with_index do |val, index|
      if val["priority"] <= @max
        @max = val["priority"]
        @max_index = index
        @gift = val["gift"]
      end
    end

    @queue.delete_at(@max_index)
    @gift
  end

end

a = HolidayPriorityQueue.new
puts a.addGift({"gift" => "regalo1", "priority" => 5})
puts a.addGift({"gift" => "regalo2", "priority" => 1})
puts a.addGift({"gift" => "regalo3", "priority" => 4})
puts a.addGift({"gift" => "regalo4", "priority" => 8})
puts a.addGift({"gift" => "regalo5", "priority" => 2})

puts a.buyGift
puts a.buyGift
puts a.buyGift
puts a.buyGift
puts a.buyGift
puts a.buyGift