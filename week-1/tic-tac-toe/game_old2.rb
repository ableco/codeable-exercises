def set_player
	if @run_game[:current_player] === @run_game[:players][:user]
		@run_game[:current_player] = @run_game[:players][:bot]
	else
		@run_game[:current_player] = @run_game[:players][:user]
	end
end

def get_move
	send(@run_game[:current_player][:turn])
end

def user_move
	puts "\nGive me your best move. You are X:"
	validation(gets.to_i)
end

def bot_move
	validation(rand(1..9))
end

def validation(move)
	if @run_game[:game][move - 1] === "-"
		@run_game[:last_move] = move - 1
	else
		get_move
	end
end

def update_game
	curret_move = @run_game[:last_move]
	@run_game[:game][curret_move] = (@run_game[:current_player] == @run_game[:players][:user]) ? "x" : "o"
	@run_game[:current_player][:game][curret_move] = "x"
end

def show_game
	system "clear"
	@run_game[:game].scan(/.../).each do |item|
		puts item.split("").join(" ")
	end
end

def game_over?
	winner = @run_game[:winners].any? do |play_win|
		@run_game[:current_player][:game] =~ play_win  
	end
	if winner
		puts "Game over: WIN #{@run_game[:current_player][:name]}"
		return true
	elsif @run_game[:game].count("-") == 0
		puts "Game over: TIED MATCH"
		return true
	end
	false
end

def launch_game
	set_player
	get_move
	update_game
	show_game
	launch_game unless game_over?
end

@run_game = {
  players: {
    user: {
      name: "User",
      game: "---------",
      turn: "user_move"
    },
    bot: {
      name: "Bot",
      game: "---------",
      turn: "bot_move"
    }
  },
  current_player: nil,
  last_move: nil,
  game: "---------",
  winners: [
		Regexp.new(/^xxx|xxx$|---xxx---/),      # rows
		Regexp.new(/x..x..x/),   								# columns
    Regexp.new(/x...x...x/),  							# diagonal 1
    Regexp.new(/..x.x.x../)   							# diagonal 2
  ]
}

puts "\n### Welcome to Tic tac toe ###"

(@run_game[:current_player] = @run_game[:players][:bot]) unless @run_game[:current_player]
launch_game
