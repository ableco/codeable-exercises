# TODO: complete this class

class PaginationHelper

  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end
  
  # returns the number of items within the entire collection
  def item_count
  @collection.count
  end
	
  # returns the number of pages
  def page_count
    divided_array = @collection.each_slice(@items_per_page).to_a
    num_pages = divided_array.count
    return num_pages
  end
	
  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    divided_array_other = @collection.each_slice(@items_per_page).to_a
    #page_counter = divided_array_other[page_index].count
    #(page_counter = -1) if (page_counter == nil)
    (divided_array_other[page_index] != nil)? (page_counter = divided_array_other[page_index].count):(page_counter = -1)
    return page_counter
  end
	
  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index) 
    divided_array_third = @collection.each_slice(@items_per_page).to_a
    array_pages_bool = divided_array_third.each_with_index.map { |x,_i| x.any?(item_index) }
    igot_pageindex = array_pages_bool.index(true)
    (igot_pageindex = -1) if (igot_pageindex == nil)
    return igot_pageindex
  end
  
end
helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
puts helper.page_count # return 2: expected 2
puts helper.item_count # return 6: expected 6
puts helper.page_item_count(0) #test passed
puts helper.page_item_count(1) #test passed
puts helper.page_item_count(2) #test passed
puts "---"*10
puts "Why????"
puts helper.page_index(1) #error
puts helper.page_index(0)

 