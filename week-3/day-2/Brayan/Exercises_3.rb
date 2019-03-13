class HighScoreTable
  attr_reader :scores, :max_scores
  def initialize(value)
    @scores = []
    @max_scores = value
  end
  
  def update(new_score)
    @scores << new_score
    @scores = @scores.sort.reverse.take(@max_scores)
  end
  
  def reset()
    @scores = []
  end
end


high_scores = HighScoreTable.new(3)
puts high_scores.scores.to_s #  [])

high_scores.update(10)
puts high_scores.scores.to_s #  [10])

high_scores.update(8)
high_scores.update(12)
puts high_scores.scores.to_s #  [12, 10, 8])

high_scores.update(5)
puts high_scores.scores.to_s #  [12, 10, 8])

high_scores.update(10)
puts high_scores.scores.to_s #  [12, 10, 10])

high_scores.update(10)
puts high_scores.scores.to_s #  [12, 10, 10])

high_scores.update(20)
puts high_scores.scores.to_s #  [20, 12, 10])

high_scores.update(20)
puts high_scores.scores.to_s #  [20, 20, 12])

high_scores.update(20)
puts high_scores.scores.to_s #  [20, 20, 20])

high_scores.reset()
puts high_scores.scores.to_s #  [])