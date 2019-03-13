#https://www.codewars.com/kata/paginationhelper/train/ruby

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
      ((@collection.count).to_f / @items_per_page).ceil
    end
      
    # returns the number of items on the current page. page_index is zero based.
    # this method should return -1 for page_index values that are out of range
    def page_item_count(page_index)
      if (page_index > (page_count - 1)) || page_index < 0
        return -1
      end
      return ((page_index + 1) * @items_per_page) % item_count
    end
      
    # determines what page an item is on. Zero based indexes.
    # this method should return -1 for item_index values that are out of range
    def page_index(item_index)
          if (item_index > item_count - 1) || item_index < 0
        return -1
      end
      return (((item_index + 1).to_f / @items_per_page).ceil) - 1   
    end
end

helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
puts helper.page_count # should == 2
puts helper.item_count # should == 6
puts helper.page_item_count(0)  # should == 4
puts helper.page_item_count(1) # last page - should == 2
puts helper.page_item_count(2) # should == -1 since the page is invalid
puts helper.page_index(5) # should == 1 (zero based index)
puts helper.page_index(2) # should == 0
puts helper.page_index(20) # should == -1
puts helper.page_index(-10) # should == -1 because negative indexes are invalid