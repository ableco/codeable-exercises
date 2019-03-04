require "./Classes/Player.rb"

class Human < Player
  def move
    puts "\nGive me your best move. You are X:"
    return (gets.to_i - 1)
  end
end