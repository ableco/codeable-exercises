class HighScoreTable
  def initialize(table_length)
    @table_length = table_length
    @highscore_table = []
    @highscore
  end
  
  def scores
    @highscore_table
  end
  
  def update(num)
    @highscore_table << num
    @highscore_table = @highscore_table.sort.reverse
    p @highscore_table
    if @highscore_table.length > @table_length
      @highscore_table = @highscore_table.take(@table_length)
    end
    return @highscore_table
  end

  def reset
    @highscore = nil
    @highscore_table = []
  end
end

hs = HighScoreTable.new(3)
hs.update(10)
hs.update(8)
hs.update(12)
hs.update(5)
hs.update(10)
puts "\n"
p hs.scores