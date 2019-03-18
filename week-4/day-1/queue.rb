class DataStructureQueue
  def initialize
    @list = []
  end

  def add_list(value)
    @list << value
  end

  def delete_list
    value = @list.shift
    "The value out is #{value}"
  end

  def show_list
    @list.to_s
  end
end