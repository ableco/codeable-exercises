class PaginationHelper
  def initialize(collection, items_per_page)
    @number_items = items_per_page
    @array = collection.group_by.with_index {|_, ind| (ind/items_per_page).floor }
  end
  
  def item_count
    @array.values.flatten.count
  end
	
  def page_count
    @array.count
  end
	
  def page_item_count(page_index)
    return -1 if @array[page_index] == nil
    @array[page_index].count
  end
	
  def page_index(item_index)
    return -1 unless (0...item_count) === item_index
    return item_index / @number_items
  end
end

#Use it as test case in Codewars
describe "Solution" do
  it "Validate feature pagination" do
    helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
    Test.assert_equals(helper.page_count, 2, "Validate Test 1")
    Test.assert_equals(helper.item_count, 6, "Validate Test 2")
    Test.assert_equals(helper.page_item_count(0), 4, "Validate Test 3")
    Test.assert_equals(helper.page_item_count(1), 2, "Validate Test 4")
    Test.assert_equals(helper.page_item_count(2), -1, "Validate Test 5")
    Test.assert_equals(helper.page_index(5), 1, "Validate Test 6")
    Test.assert_equals(helper.page_index(2), 0, "Validate Test 7")
    Test.assert_equals(helper.page_index(20), -1, "Validate Test 8")
    Test.assert_equals(helper.page_index(-10), -1, "Validate Test 9")
  end
end