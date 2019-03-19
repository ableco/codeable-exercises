class HolidayPriorityQueue
  def initialize
    @list = []
  end
  
  def addGift gift
    @list << gift
    @list.length
  end
  
  def buyGift
    return "" if @list.length == 0
    gift = @list.min {|val1, val2| val1["priority"] <=> val2["priority"]}
    @list.delete_at(@list.index(gift))
    gift["gift"]
  end

end