class PaginationHelper
  def initialization(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end

  def page_count
    (@collection.length / @items_per_page).ceil
  end

  def item_count
    @collection.length
  end

  def page_item_count(page_index)
    
  end

  def page_index(item_index)
  end
end