# TODO: complete this class

class PaginationHelper

    # The constructor takes in an array of items and a integer indicating how many
    # items fit within a single page
    def initialize(collection, items_per_page)
        @collection = collection
        @ixp = items_per_page
        
        pages = collection.count / @ixp + (if collection.count % @ixp > 0 then 1 else 0 end)
        @pages_collection = []
        pages.times { @pages_collection << []}

        collection.each_with_index do |val, index|
            page = index / @ixp
            @pages_collection[page] << val
        end
    end
    
    # returns the number of items within the entire collection
    def item_count
        @collection.count
    end
      
    # returns the number of pages
    def page_count
        @pages_collection.count
    end
      
    # returns the number of items on the current page. page_index is zero based.
    # this method should return -1 for page_index values that are out of range
    def page_item_count(page_index)
      if !!@pages_collection[page_index]
        @pages_collection[page_index].count
      else
        -1
      end
    end
      
    # determines what page an item is on. Zero based indexes.
    # this method should return -1 for item_index values that are out of range
    def page_index(item_index)
        if (0..(item_count-1)).to_a.include?(item_index)
            item_index / @ixp
        else
            -1
        end
    end
end

helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
  puts helper.page_count
  puts helper.item_count
  puts helper.page_item_count(0)
  puts helper.page_item_count(1)
  puts helper.page_item_count(2)
  puts helper.page_index(5) # should == 1 (zero based index)
  puts helper.page_index(2) # should == 0
  puts helper.page_index(20) # should == -1
  puts helper.page_index(-23) # should == -1 because negative indexes are invalid
