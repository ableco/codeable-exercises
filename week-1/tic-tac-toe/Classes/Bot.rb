require "./Classes/Player.rb"

class Bot < Player
  def move
    return rand(0..8)
  end
end