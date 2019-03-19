class HolidayPriorityQueue
  def initialize
    @list = []
  end
  
  def add_gift gift
    #Insert gift into priority queue and return new length
    @list << gift
    @list.sort_by! { |hash| hash['priority'] }
    @list.length
  end
  
  def buy_gift
    #Return gift with highest priority (lowest integer value)
    if @list.length <= 0 
      return ''
    else
      highest_priority = @list.first
      @list.shift
      highest_priority['gift']
    end    
  end
end