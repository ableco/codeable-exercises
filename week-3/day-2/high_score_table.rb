class HighScoreTable
  attr_accessor :scores
  
  def initialize(scores_size)
    @scores_size = scores_size
    @scores = []
  end
  
  def update(new_score)
    @scores << new_score
    @scores.sort!.reverse!
    @scores.pop if @scores.length > @scores_size
  end
  
  def reset()
    @scores = []
  end
  
end


high_scores = HighScoreTable.new(3)

high_scores.update(10)
high_scores.update(8)
high_scores.update(12)
puts high_scores.scores.inspect
