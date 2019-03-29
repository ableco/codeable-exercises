class PaginationHelper

  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end
  
  def item_count
    @collection.count
  end

  def page_count
    ((@collection.count).to_f / @items_per_page).ceil
  end
	
  def page_item_count(page_index)
    if (page_index > (page_count - 1)) || page_index < 0
      return -1
    end
    return @items_per_page - ((((page_index + 1) * @items_per_page) % item_count) % @items_per_page).ceil 
  end
	
  def page_index(item_index) 
    if (item_index > item_count - 1) || item_index < 0
      return -1
    end
    return (((item_index + 1).to_f / @items_per_page).ceil) - 1
  end
end

helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
p helper.page_count # should == 2
p helper.item_count # should == 6
p helper.page_item_count(0)  # should == 4
p helper.page_item_count(1) # last page - should == 2
p helper.page_item_count(2) # should == -1 since the page is invalid
p helper.page_index(5) # should == 1 (zero based index)
p helper.page_index(2) # should == 0
p helper.page_index(20) # should == -1
p helper.page_index(-10) # should == -1 because negative indexes are invalid