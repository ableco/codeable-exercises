class HighScoreTable
    def initialize (size)
        @max_size = size
        @table = []
        @high_score_table = []
    end

    def scores
        @high_score_table
    end

    def update(score)
        @table << score
        @table.sort! { |x,y| y <=> x }
        @high_score_table = @table.first(@max_size)
    end

    def reset
        @table = []
        @high_score_table = []
    end
end

high_scores = HighScoreTable.new(3)

high_scores.update(10)
puts high_scores.scores.to_s
high_scores.update(8)
puts high_scores.scores.to_s
high_scores.update(12)
puts high_scores.scores.to_s
high_scores.update(15)
puts high_scores.scores.to_s
high_scores.update(12)
puts high_scores.scores.to_s
high_scores.reset
puts high_scores.scores.to_s