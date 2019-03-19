class HolidayPriorityQueue
  def initialize
    #Priority queue Constructor
    @gifts = []
  end
  
  def addGift gift
    #Insert gift into priority queue and return new length
    @gifts << gift
    @gifts.size
  end
  
  def buyGift
    #Return gift with highest priority (lowest integer value)
    return '' if @gifts.empty?
    @gifts.sort_by! { |gift| gift["priority"] }
    @gifts.shift["gift"]
  end

end

giftList = HolidayPriorityQueue.new
length = 0
puts giftList.addGift({ 'gift' => 'Water gun', 'priority' => 3 } )
puts giftList.addGift({ 'gift' => 'Space', 'priority' => 0 } )
puts giftList.addGift({ 'gift' => 'Data', 'priority' => 1 } )
puts giftList.buyGift() # 'Space'
