class Queue

    attr_accessor(:data , :tail)
   
    def initialize
   
     @data=[] #array
     @tail = -1
    end
   
    def addGift (a) 
   
     @data << a
     @tail += 1
   
     return @data.length
   
    end
   
    def buyGift
   
    return "" if @data.empty? 
   
    array_priority = @data.map {|x| x["priority"]}
   
    index_min = array_priority.index(array_priority.min)
   
    result = @data[index_min] 
   
    @data.delete_at(index_min)
   
    @tail -= 1 
   
    result["gift"] if(result != nil)
   
    end
   
   
    def empty?
   
     @tail == -1
   
    end
   
   end
   
   ​
   
   myList = Queue.new
   
   puts myList.addGift({"gift" => "Water Gun", "priority" => 10})
   
   puts myList.addGift({"gift" => "Candy", "priority" => 3})
   
   puts myList.buyGift()
   
   puts myList.buyGift()
   
   puts myList.buyGift()