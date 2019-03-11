require "./Classes/Bot.rb"
require "./Classes/Human.rb"
require "./Classes/Game.rb"

def create_game
  player1 = Human.new("User", "x")
  player2 = Bot.new("Bot", "o")
  game = Game.new(player1, player2)
  game
end

def init_game
  system "clear"
  puts "1 2 3  |  - - -"
  puts "4 5 6  |  - - -"
  puts "7 8 9  |  - - -"
  game = create_game
  game.run_game
end

init_game