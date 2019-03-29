class HolidayPriorityQueue
  def initialize
    #Priority queue Constructor
    @list = Array.new
  end
  
  def addGift gift
    #Insert gift into priority queue and return new length
    @list.push(gift)
    @list.length
  end
  
  def buyGift
    #Return gift with highest priority (lowest integer value)
    if @list.length == 0
      return ""
    end
    @list.sort_by! { |a| a["priority"] }
    temporal = @list.pop
    temporal["gift"]
  end
end

test = HolidayPriorityQueue.new
puts test.addGift({ 'gift' => 'Water gun', 'priority' => 1 })
puts test.addGift({ 'gift' => 'Toy truck', 'priority' => 4 })
puts test.addGift({ 'gift' => 'Roller Skates', 'priority' => 3 })


puts test.buyGift()
puts test.buyGift()
puts test.buyGift()
