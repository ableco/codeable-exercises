# Holiday Shopping Priority Queue
# Priority queues are similar to queues, but they add a priority to each data entry, so items with higher priorities 
#(lower integer values) are processed first.

# While I'm running around buying the gifts, I need you to write a few methods for the HolidayPriorityQueue class
# to help me out. The class needs two methods: addGift and buyGift. For this Kata, all priorities will be unique, 
#so no need to worry about equal priorities.

# Method descriptions:
# addGift (or enqueue) adds a gift to the priority queue. This method should accept one object (or hash in ruby), 
#which has two properties: gift - the name of the gift, and priority - the priority of the gift, and should return 
#the new length of the queue. All gifts will be in this form.

# buyGift (or dequeue) removes the gift with the highest priority from the priority queue, and returns the gifts name 
#(value of the gift property). If the queue is empty, return the empty string ''

# Examples:

# Ruby
# gift_list = HolidayPriorityQueue.new
# gift_list.addGift( { 'gift' => 'Water gun', 'priority' => 1 } )// => returns 1
# gift_list.addGift( { 'gift' => 'Toy truck', 'priority' => 4 } )// => returns 2
# gift_list.addGift( { 'gift' => 'Roller Skates', 'priority' => 3} )// => returns 3



class HolidayPriorityQueue
  def initialize
  @giftlist=Array.new()
  end
  
  def addGift gift
  @giftlist << gift
  @giftlist.sort_by! { |gift| gift['priority'] }
  @giftlist.size
  end
  
  def buyGift
      return "" if @giftlist.empty? 
      @giftlist.shift()["gift"]
  end
end
  gift_list = HolidayPriorityQueue.new
gift_list.addGift( { 'gift' => 'Water gun', 'priority' => 1 } )
gift_list.addGift( { 'gift' => 'Toy truck', 'priority' => 4 } )
gift_list.addGift( { 'gift' => 'Roller Skates', 'priority' => 3} )
gift_list.buyGift()

#Extra Solution
# def initialize
#   @list = {}
# end

# def addGift gift
#   @list.merge!(Hash[*gift.values.reverse]).length
# end

# def buyGift
#   @list.delete(@list.keys.min) || ""
# end