class PaginationHelper

  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = Array.new(collection.length,1)
    @collection = @collection.each_with_index.map {|v,i| i/items_per_page}
  end
  
  # returns the number of items within the entire collection
  def item_count
    @collection.length
  end
	
  # returns the number of pages
  def page_count
    @collection.max + 1
  end
	
  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    return -1 if page_index > @collection[-1] || page_index < 0
    @collection.count {|v| v == page_index}
  end
	
  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index) 
    return -1 if !(item_index < item_count) || item_index < 0
    @collection[item_index]
  end
end


helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
# @collection = [0, 0, 0, 0, 1, 1]

puts helper.page_count
puts helper.item_count
puts helper.page_item_count(1)
puts helper.page_index(6)


# Dante Calderon