class HolidayPriorityQueue
    def initialize
      #Priority queue Constructor
      @list = []
    end
    
    def addGift gift
      #Insert gift into priority queue and return new length
      @list << gift
      @list.length
    end
    
    def buyGift
      #Return gift with highest priority (lowest integer value)
      return "" if @list.empty? 
      @list.sort_by! { |val| val["priority"] }
      puts @list
      @list.shift["gift"]   
    end
  
  end