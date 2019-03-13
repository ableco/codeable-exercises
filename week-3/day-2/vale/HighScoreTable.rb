#https://www.codewars.com/kata/high-score-table/train/ruby

class HighScoreTable
    def initialize(top)
        @top = top
        @scores = []
    end
   
    def scores
        @scores
    end
   
    def update(new_scores)
        @scores << new_scores
        @scores.sort!.reverse!# {|a,b| b <=> a}
        if @scores.length > @top
        @scores.pop()
        end
    end
   
    def reset
        @scores = []
    end
end