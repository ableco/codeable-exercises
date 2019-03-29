class HolidayPriorityQueue
  def initialize
    @giftList = []
  end
  
  def addGift gift
    @giftList.push(gift)
    @giftList.sort_by! { |gift| gift['priority'] }
    @giftList.length
  end
  
  def buyGift
    return "" if @giftList.empty? 
    @giftList.shift()["gift"]
  end

end

giftList = HolidayPriorityQueue.new
length = 0


puts giftList.addGift( { 'gift' => 'Water 1 gun', 'priority' => 3 } )
puts giftList.addGift( { 'gift2' => 'Water 2 gun', 'priority' => 2 } )
puts giftList.addGift( { 'gift3' => 'Water 3 gun', 'priority' => 1 } )
puts giftList.buyGift()