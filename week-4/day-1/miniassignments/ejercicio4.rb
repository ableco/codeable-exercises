# https://www.codewars.com/kata/holiday-shopping-priority-queue/train/ruby

class HolidayPriorityQueue
    attr_accessor(:data,:tail)
    def initialize
      #Initialize array 'data' empty 
      @data=[]
      
    end
    
    def addGift gift
      #Insert gift into priority queue and return new length
      @data << gift
      return @data.length
    end
    
    def buyGift
      #Return gift with highest priority (lowest integer value)
      return "" if @data.empty?
      array_priority = @data.map {|x| x["priority"]}
      index_min = array_priority.index(array_priority.min)
      result = @data[index_min]
      @data.delete_at(index_min)
      result["gift"]
    end
end
